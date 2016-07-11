//
//  MyViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MyViewController.h"

#import "LoginViewController.h"

#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"



@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic,strong) NSArray *titles;


@property(nonatomic,strong) MyHeaderTableViewCell *myHeadercell;

@end

@implementation MyViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.myTableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//        [self.myTableView reloadData];

     self.automaticallyAdjustsScrollViewInsets = NO;
    self.titles = @[@"我的活动",@"我的电影",@"清除缓存"];
    [self addRightNavigationItem];

    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identify];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identify];
    

    
}

-(void)addRightNavigationItem
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 40, 30);
    
    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(rightBarItemClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [btn setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateNormal];
    
}

//登录
-(void)rightBarItemClicked:(UIButton *)btn
{
    NSLog(@"登录");
    //跳转到登录页面
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    LoginViewController *loginV = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self presentViewController:loginV animated:YES completion:nil];
}

-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位MB
    
    return cacheFolderSize/1024/1024;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 154;
    }
    
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identify];
        NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"];
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"avatar"];
        NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85%@",string]];

        cell.username.text = str;
        [cell.avatarImageV setImageWithURL:imageUrl];
        
        
        return cell;
    }
    else
    {
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identify];
        
        cell.contenlabel.text = self.titles[indexPath.row-1];
        
        if (indexPath.row == 3) {
            
            cell.hehelabel.text = [NSString stringWithFormat:@"%.1fM",[self getFilePath]];
        }
        return cell;
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 3) {
        [self removeCache];
        [self.myTableView reloadData];
    }
}

-(void)removeCache
{
    //===============清除缓存==============
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    //    NSLog(@"文件数 ：%d",[files count]);
    for (NSString *p in files)
    {
        NSError *error;
        NSString *path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        if([[NSFileManager defaultManager] fileExistsAtPath:path])
        {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"缓存清理成功" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:okAction];
    
    [self presentViewController:alertC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
