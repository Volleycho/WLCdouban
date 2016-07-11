//
//  MovieTableViewCell.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
//MovieTableViewCell的重用标识符
#define MovieTableViewCell_Identify @"MovieTableViewCell_Identify"

@interface MovieTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImageV;

@property (weak, nonatomic) IBOutlet UILabel *movieTitle;

@property (weak, nonatomic) IBOutlet UILabel *movieXingji;

@property (weak, nonatomic) IBOutlet UILabel *movieDate;

@property(nonatomic,strong) MovieModel *movieMdel;

@end
