//
//  MovieTableViewCell.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMovieMdel:(MovieModel *)movieMdel
{
    _movieMdel = movieMdel;
    
    [self.movieImageV setImageWithURL:[NSURL URLWithString:[movieMdel.images objectForKey:@"small"]]];
    
    self.movieTitle.text = movieMdel.title;
    
    self.movieXingji.text = movieMdel.stars;
    self.movieDate.text = movieMdel.pubdate;
    
}


@end
