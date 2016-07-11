//
//  MyHeaderTableViewCell.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <UIKit/UIKit.h>

//MyHeaderTableViewCell的重用标识符
#define MyHeaderTableViewCell_Identify @"MyHeaderTableViewCell_Identify"

@interface MyHeaderTableViewCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UIImageView *avatarImageV;

@property (weak, nonatomic) IBOutlet UILabel *username;




@end
