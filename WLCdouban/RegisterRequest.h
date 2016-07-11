//
//  RegisterRequest.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject

-(void)registerRequestWithUsername:(NSString *)username
                       password:(NSString *)password
                         avator:(UIImage *)image
                        success:(SuccessResponse)success
                        failure:(FailureResponse)failure;

@end
