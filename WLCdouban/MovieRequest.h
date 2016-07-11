//
//  MovieRequest.h
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieRequest : NSObject

- (void)MovieRequestWithparameter:(NSDictionary *)parameterDic
                       success:(SuccessResponse)success
                       failure:(FailureResponse)failure;

@end
