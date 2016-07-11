//
//  RegisterRequest.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest


-(void)registerRequestWithUsername:(NSString *)username
                          password:(NSString *)password
                            avator:(UIImage *)image
                           success:(SuccessResponse)success
                           failure:(FailureResponse)failure
{
    NSDictionary *parameter = @{@"userName":username,@"password":password};
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    [request sendImageWithUrl:RegistRequest_Url parameter:parameter image:image successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
    
    
    
}


@end
