//
//  DouBanTabBar.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//



#import <UIKit/UIKit.h>

@class DouBanTabBar;
@protocol DouBanDelegate <NSObject>

-(void)DouBanItemDidClicked:(DouBanTabBar *)tabBar;

@end


@interface DouBanTabBar : UITabBar

//当前选中的tabbar下标
@property(nonatomic,assign) int currentSelected;

//当前选中的item
@property(nonatomic,strong) UIButton *currentSelectedItem;

//tabbar上所有的item
@property(nonatomic,strong) NSArray *allItems;

@property(nonatomic,weak) id<DouBanDelegate>doubandelegate;


//初始化方法：根据items初始化items
-(id)initWithItems:(NSArray *)items frame:(CGRect)frame;



@end
