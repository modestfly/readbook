//
//  RBURLSessionDataTaskWapper.h
//  ReadBook
//
//  Created by test on 2018/8/10.
//  Copyright © 2018年 Freedom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBURLSessionDataTaskWapper : NSObject

@property(nonatomic,strong)           NSURLSessionDataTask *task;
@property(nonatomic,strong,readonly)  NSString *responseString;
@property(nonatomic,strong)           NSData *resopnseData;

@end
