//
//  MovieDetailViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#pragma mark --分享
#import <UMSocialData.h>
#import <UMSocialSnsService.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialQQHandler.h>
#import <UMSocialSnsPlatformManager.h>


#import "MovieDetailViewController.h"
#import "MovieDetailRequest.h"


@interface MovieDetailViewController ()<UMSocialUIDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *MovieDVImageV;

@property (weak, nonatomic) IBOutlet UILabel *FristLabel;
@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *ThreeLabel;

@property (weak, nonatomic) IBOutlet UILabel *FourLabel;

@property (weak, nonatomic) IBOutlet UILabel *FiveLabel;



@property (weak, nonatomic) IBOutlet UILabel *TextLabel;

@end

@implementation MovieDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.model.title;
    
    [self.MovieDVImageV setImageWithURL:[NSURL URLWithString:[self.model.images objectForKey:@"small"]]];
    
    self.FristLabel.text = self.model.rating;
    self.SecondLabel.text = self.model.pubdate;


    
    [self requestMovieDetailDataWith:self.model.ID];
    
    
    UIBarButtonItem *bar1 = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction:)];
    UIBarButtonItem *bar2 = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:(UIBarButtonItemStylePlain) target:self action:@selector(collectAction)];
    self.navigationItem.rightBarButtonItems = @[bar1,bar2];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


-(void)requestMovieDetailDataWith:(NSString *)ID
{
    MovieDetailRequest *request = [[MovieDetailRequest alloc]init];
    [request movieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"success = %@",dic);
        
        NSString *summary = [dic objectForKey:@"summary"];
        self.TextLabel.text = summary;
        NSArray *durations = [dic objectForKey:@"durations"];
        self.ThreeLabel.text = durations.firstObject;
        NSArray *genres = [dic objectForKey:@"genres"];
        self.FourLabel.text = genres.firstObject;
        
        NSArray *countries = [dic objectForKey:@"countries"];
        
        self.FiveLabel.text = [NSString stringWithFormat:@"%@ %@",countries.firstObject,countries.lastObject];
        
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}

#pragma mark --分享
-(void)shareAction:(UIBarButtonItem *)sender{
    
    //    [UMSocialData defaultData].extConfig.title = @"分享的title";
    //    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    //    [UMSocialSnsService presentSnsIconSheetView:self
    //                                         appKey:@"507fcab25270157b37000010"
    //                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
    //                                     shareImage:[UIImage imageNamed:@"icon"]
    //                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
    //                                       delegate:self];
    
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:@"http://www.baidu.com/img/bdlogo.gif"];
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
    
    
}

//收藏
-(void)collectAction{
    
    
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
