//
//  RootViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "RootViewController.h"
#import "DouBanTabBar.h"

@interface RootViewController ()<DouBanDelegate>

@property(nonatomic,strong) DouBanTabBar *dbTabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"paper.png"] forState:(UIControlStateNormal)];
    [btn1 setImage:[UIImage imageNamed:@"paperH.png"] forState:(UIControlStateSelected)];
    [btn1 setTitle:@"活动" forState:(UIControlStateNormal)];
    
//    [btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
//    [btn1 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    [btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
    
    [btn1 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn1 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -70, -30, 0))];

    
//    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
//     [self setChildButton:btn1 title:@"活动" image:@"paper" selected:@"paperH"];
    

    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"video.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"videoH.png"] forState:UIControlStateSelected];
    [btn2 setTitle:@"电影" forState:(UIControlStateNormal)];
//    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
//    [btn2 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    [btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
    
    [btn2 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -70, -30, 0))];

    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setImage:[UIImage imageNamed:@"2image.png"] forState:(UIControlStateNormal)];
    [btn3 setImage:[UIImage imageNamed:@"2imageH.png"] forState:(UIControlStateSelected)];
    [btn3 setTitle:@"影院" forState:(UIControlStateNormal)];
//    [btn3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
//    [btn3 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    [btn3 setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
    
    [btn3 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn3 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -70, -30, 0))];

    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setImage:[UIImage imageNamed:@"person.png"] forState:(UIControlStateNormal)];
    [btn4 setImage:[UIImage imageNamed:@"personH.png"] forState:(UIControlStateSelected)];
    [btn4 setTitle:@"我" forState:(UIControlStateNormal)];
//    [btn4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    
//    [btn4 setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    
    [btn4 setTitleColor:[UIColor blackColor] forState:(UIControlStateSelected)];
    
    [btn4 setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    [btn4 setTitleEdgeInsets:(UIEdgeInsetsMake(0, -50, -30, 0))];

    
    
    
    self.dbTabBar = [[DouBanTabBar alloc]initWithItems:@[btn1,btn2,btn3,btn4] frame:CGRectMake(0, WindowHeight-49, WindownWidth, 49)];
    
    
    
    
    [self.view addSubview:self.dbTabBar];
    
    self.dbTabBar.doubandelegate = self;
    
}

//自定义方法设置背景图片和文字
//-(UIButton *)setChildButton:(UIButton *)button
//                      title:(NSString *)title
//
//                      image:(NSString *)image
//                   selected:(NSString *)selected{
//    
//    [button setTitle:title forState:(UIControlStateNormal)];
//    [button setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
//    [button setImage:[UIImage imageNamed:selected] forState:(UIControlStateSelected)];
//    
//    return button;
//}





-(void)DouBanItemDidClicked:(DouBanTabBar *)tabBar
{
    self.selectedIndex = tabBar.currentSelected;

    

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
