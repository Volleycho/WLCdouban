//
//  ActivityViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityModel.h"
#import "ActivityRequest.h"
#import "ActivityDetailViewController.h"




@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *ActivityTableView;


@property(nonatomic,strong) NSMutableArray *ActivityArray;

@end

@implementation ActivityViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.ActivityArray = [NSMutableArray array];
    
    //注册
    [self.ActivityTableView registerNib:[UINib nibWithNibName:@"ActivityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ActivityTableViewCell_Identify];
    
    ActivityRequest *request = [[ActivityRequest alloc]init];
    
    [request activityRequestWithparameter:nil success:^(NSDictionary *dic) {
        
        for (NSDictionary *tempDic in dic[@"events"]) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [self.ActivityArray addObject:model];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            
        [LBProgressHUD hideAllHUDsForView:self.view animated:YES];

        [self.ActivityTableView reloadData];

        }) ;

        

        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)viewDidAppear:(BOOL)animated{
    
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
    return self.ActivityArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityTableViewCell_Identify];
    
    ActivityModel*model= self.ActivityArray[indexPath.row];
    
    
    
    [cell setModel:model];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityModel *model = self.ActivityArray[indexPath.row];
    [self performSegueWithIdentifier:@"activityDetail" sender:model];

    
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        ActivityDetailViewController *detaiV = segue.destinationViewController;
        detaiV.model =sender;
    }
    
}


@end
