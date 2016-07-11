//
//  OwnerModel.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel

//数据格式
@property(nonatomic,copy)NSString * alt;
//评分平均值
@property(nonatomic,copy)NSString * avatar;
//电影的ID
@property(nonatomic,copy)NSString * ID;
//
@property(nonatomic,copy)NSString * large_avatar;

@property(nonatomic,copy)NSString * name;

@property(nonatomic,copy)NSString * type;

@property(nonatomic,copy)NSString * uid;

@end
