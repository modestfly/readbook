//
//  RBURLSessionDataTaskWapper.m
//  ReadBook
//
//  Created by test on 2018/8/10.
//  Copyright © 2018年 Freedom. All rights reserved.
//

#import "RBURLSessionDataTaskWapper.h"

@implementation RBURLSessionDataTaskWapper

- (NSString *)responseString{
    
    if (!self.resopnseData) return nil;
    @try {
        
        return [[NSString alloc] initWithData:self.resopnseData encoding:[self responseStringEncoding]];
    }
    @catch(NSException *exception) {
    
        NSLog(@"exception:%@,%@",exception.name,exception.reason);
    }
    @finally {
        
    }
    
}

- (NSStringEncoding)responseStringEncoding{
    
    NSURLResponse *response = self.task.response;
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

@end
