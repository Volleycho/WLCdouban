//
//  MyHeaderTableViewCell.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MyHeaderTableViewCell.h"

@implementation MyHeaderTableViewCell









- (void)awakeFromNib {
    // Initialization code
    
    self.avatarImageV.layer.masksToBounds = YES;
    
    self.avatarImageV.layer.cornerRadius = self.avatarImageV.bounds.size.width/2.0;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
