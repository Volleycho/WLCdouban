//
//  ActivityDetailRequest.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest


-(void)activityDetailRequestWithParameter:(NSDictionary *)parameter
                                  success:(SuccessResponse)success
                                  failure:(FailureResponse)failure
{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:ActivityDetailRequest_Url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
       
        success(dic);
    
    } failureResponse:^(NSError *error) {
        
        failure(error);
   
    }];
    
    
}

@end
