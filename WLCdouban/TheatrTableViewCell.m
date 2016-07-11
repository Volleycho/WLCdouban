//
//  TheatrTableViewCell.m
//  WLCdouban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "TheatrTableViewCell.h"

@implementation TheatrTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TheatrModel *)model
{
    self.FristLabel.text = model.cinemaName;
    
    self.SecondLabel.text = model.address;
    
    self.ThreeLabel.text = model.telephone;
    
}



@end
