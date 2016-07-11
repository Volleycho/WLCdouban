//
//  MovieModel.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@, images = %@",self.ID,self.images];
    
}

@end
