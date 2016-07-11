//
//  ActivityTableViewCell.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

//ActivityTableViewCell的重用标识符
#define ActivityTableViewCell_Identify @"ActivityTableViewCell_Identify"

@interface ActivityTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@property (weak, nonatomic) IBOutlet UILabel *datelabel;


@property (weak, nonatomic) IBOutlet UILabel *adresslabel;


@property (weak, nonatomic) IBOutlet UILabel *typelabel;


@property (weak, nonatomic) IBOutlet UILabel *interestingNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *joinNumberLabel;

@property (weak, nonatomic) IBOutlet UIImageView *ActivityImageV;


@property(nonatomic,strong) ActivityModel *model;


@end
