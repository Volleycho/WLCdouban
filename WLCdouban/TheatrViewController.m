//
//  TheatrViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "TheatrViewController.h"

#import "TheatrMapViewController.h"

#import "TheatrTableViewCell.h"

#import "TheatrRequest.h"

#import "TheatrModel.h"

@interface TheatrViewController ()<UITableViewDataSource,UITableViewDelegate>

//@property(nonatomic,strong) UITableView *tableview;


@property (weak, nonatomic) IBOutlet UITableView *TheatrTableviw;

@property(nonatomic,strong) NSMutableArray *TheatrArray;

@end

@implementation TheatrViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册
    [self.TheatrTableviw registerNib:[UINib nibWithNibName:@"TheatrTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheatrTableViewCell_Identify];
    
    
    self.TheatrArray = [NSMutableArray array];
    //请求
    TheatrRequest *request = [[TheatrRequest alloc]init];
    [request TheatrRequestWithparameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        
        
        NSDictionary *arraydic = dic[@"result"];

            for (NSDictionary *Tempdic in arraydic[@"data"]) {
                TheatrModel *model = [TheatrModel new];
                [model setValuesForKeysWithDictionary:Tempdic];
                [self.TheatrArray addObject:model];
                
            }

        
        [self.TheatrTableviw reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.TheatrArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TheatrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TheatrTableViewCell_Identify];
    
    TheatrModel *model = self.TheatrArray[indexPath.row];
    
    [cell setModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TheatrMapViewController *mapV = [[TheatrMapViewController alloc]init];
    
    [self.navigationController pushViewController:mapV animated:YES];
    
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
