//
//  ActivityModel.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

- (NSString *)description
{
    return  [NSString stringWithFormat:@"ID = %@, owner = %@",self.ID,self.user];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
    else if ([key isEqualToString:@"owner"])
    {
        OwnerModel *model = [OwnerModel new];
        [model setValuesForKeysWithDictionary:value];
        _user = model;
    }
}



@end
