//
//  RBHttpRequestService.h
//  ReadBook
//
//  Created by test on 2018/8/10.
//  Copyright © 2018年 Freedom. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "RBURLSessionDataTaskWapper.h"
typedef void (^requestDataSuccessBlock)(RBURLSessionDataTaskWapper *operation,id responseObject);
typedef void (^requestDataFailBlock)(RBURLSessionDataTaskWapper *operation,NSError *error);

/**
 对网络请求AFNetworking 的封装类
*/
@interface RBHttpRequestService : NSObject

/**
 网络请求类的单例对象
 */
+ (instancetype)shareInstance;



@end
