//
//  MovieDetailRequest.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "MovieDetailRequest.h"

@implementation MovieDetailRequest

-(void)movieDetailRequestWithParameter:(NSDictionary *)parameter
                               success:(SuccessResponse)success
                               failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:movieDetailRequest_Url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        
        success(dic);
        
    } failureResponse:^(NSError *error) {
        
        failure(error);
        
    }];
    
    
}

@end
