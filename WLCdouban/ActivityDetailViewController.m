//
//  ActivityDetailViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityModel.h"
#import "ActivityDetailRequest.h"

@interface ActivityDetailViewController ()


@property(nonatomic,strong) NSMutableArray *activityDetailArray;


@property (weak, nonatomic) IBOutlet UIImageView *ActivityDetailV;

@property (weak, nonatomic) IBOutlet UILabel *ActivityTitlelabel;

@property (weak, nonatomic) IBOutlet UILabel *ActivityTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *threeLabel;

@property (weak, nonatomic) IBOutlet UILabel *fourLabel;



@property (weak, nonatomic) IBOutlet UILabel *TextLabel;

@end

@implementation ActivityDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.ActivityDetailV setImageWithURL:[NSURL URLWithString:self.model.image]];
    
    self.ActivityTitlelabel.text = self.model.title;
    
    self.ActivityTimeLabel.text = [NSString stringWithFormat:@"%@-%@",self.model.begin_time,self.model.end_time];
    
    self.SecondLabel.text = self.model.user.name;
    self.threeLabel.text = self.model.category;
    
    self.fourLabel.text = self.model.address;
    
    self.TextLabel.text = self.model.content;
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
