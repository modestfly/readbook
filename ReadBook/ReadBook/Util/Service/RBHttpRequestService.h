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
typedef void (^requestDataSuccessBlock)(NSURLSessionDataTask *task,id responseObject);
typedef void (^requestDataFailBlock) (NSURLSessionDataTask *task,NSError *error);

/**
 对网络请求AFNetworking 的封装类
*/
@interface RBHttpRequestService : NSObject<NSCopying>

/**
 网络请求类的单例对象
 */
+ (instancetype)shareInstance;

#pragma marmk GET
/**
 GET请求方法
 */
-(void)getRequestForTarget:(id)target successAction:(requestDataSuccessBlock)successBlock failedAction:(requestDataFailBlock)failedBlock forServiceName:(NSString *)serviceName withParamas:(NSMutableDictionary *)paramas;

@end
