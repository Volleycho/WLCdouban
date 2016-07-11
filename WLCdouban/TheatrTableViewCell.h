//
//  TheatrTableViewCell.h
//  WLCdouban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheatrModel.h"

//TheatrTableViewCell的重用标识符
#define TheatrTableViewCell_Identify @"TheatrTableViewCell_Identify"

@interface TheatrTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *FristLabel;

@property (weak, nonatomic) IBOutlet UILabel *SecondLabel;
@property (weak, nonatomic) IBOutlet UILabel *ThreeLabel;


@property(nonatomic,strong) TheatrModel *model;

@end
