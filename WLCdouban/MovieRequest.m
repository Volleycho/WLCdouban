//
//  MovieRequest.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MovieRequest.h"

@implementation MovieRequest

- (void)MovieRequestWithparameter:(NSDictionary *)parameterDic
                    success:(SuccessResponse)success
                    failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request requestWithUrl:movieRequestWithUrl parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}

@end
