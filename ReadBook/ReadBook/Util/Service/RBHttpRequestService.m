//
//  RBHttpRequestService.m
//  ReadBook
//
//  Created by test on 2018/8/10.
//  Copyright © 2018年 Freedom. All rights reserved.
//

#import "RBHttpRequestService.h"

@interface RBHttpRequestService ()

@property   (nonatomic,strong)  AFHTTPSessionManager   *operationManager;

@end

@implementation RBHttpRequestService

static  dispatch_once_t   once;
static  RBHttpRequestService *singletion = nil;

+ (instancetype)shareInstance
{
    dispatch_once(&once, ^{
        if (singletion == nil)
        {
            singletion = [[RBHttpRequestService alloc] init];
            
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/plain",@"text/html",@"text/json",@"application/pdf",nil];
            manager.requestSerializer.timeoutInterval = 20.f;//超时时间
            singletion.operationManager = manager;
        }
    });
    
    return singletion;
}

#pragma mark GET请求方法
-(void)getRequestForTarget:(id)target successAction:(requestDataSuccessBlock)successBlock failedAction:(requestDataFailBlock)failedBlock forServiceName:(NSString *)serviceName withParamas:(NSMutableDictionary *)paramas
{
    NSString *url = @"";
    
    [self.operationManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failedBlock) {
            failedBlock(task,error);
        }
    }];
    
}
- (NSStringEncoding)responseStringEncoding:(NSURLSessionDataTask *) task{
    
    NSURLResponse *response = task.response;
    if (response) {
        NSStringEncoding stringEncoding = NSUTF8StringEncoding;
        if (response.textEncodingName) {
            
            CFStringEncoding IANAEncoding = CFStringConvertIANACharSetNameToEncoding((__bridge CFStringRef)
                                                                                     response.textEncodingName);
            if (IANAEncoding != kCFStringEncodingInvalidId) {
                stringEncoding = CFStringConvertEncodingToNSStringEncoding(IANAEncoding);
            }
        }
        return stringEncoding;
    }
    
    
    
    return NSUTF8StringEncoding;
}


#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    return singletion;
}


@end
