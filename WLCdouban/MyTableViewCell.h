//
//  MyTableViewCell.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <UIKit/UIKit.h>

//MyHeaderTableViewCell的重用标识符
#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contenlabel;

@property (weak, nonatomic) IBOutlet UILabel *hehelabel;



@end
