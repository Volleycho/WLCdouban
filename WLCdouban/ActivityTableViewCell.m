//
//  ActivityTableViewCell.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(ActivityModel *)model
{
    
    _model = model;
    self.titlelabel.text = model.title;
    self.datelabel.text = [NSString stringWithFormat:@"%@-%@",model.begin_time,model.end_time];
    self.adresslabel.text = model.address;
    self.typelabel.text = model.category;
    self.interestingNumberLabel.text = [NSString stringWithFormat:@"%@",model.wisher_count];
    self.joinNumberLabel.text = [NSString stringWithFormat:@"%@",model.participant_count];
    
    [self.ActivityImageV setImageWithURL:[NSURL URLWithString:model.image]];
    
}

@end
