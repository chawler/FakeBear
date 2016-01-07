//
//  HttpClient.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "HttpClient.h"

@interface HttpClient()

@property (nonatomic, readonly) NSHTTPCookieStorage *cookieStorage;

@end

@implementation HttpClient

+ (id)sharedInstance
{
    static HttpClient *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HttpClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.xxkuaipao.com:8003"]];
    });
    return sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        [self.requestSerializer setValue:@"card/2.3.1 (iPhone; iOS 8.4.1; Scale/2.00)" forHTTPHeaderField:@"User-Agent"];
        [self.requestSerializer setValue:@"remember_token=15626065551|fbc5817651db96b5809fab4dd77b899714dcb985" forHTTPHeaderField:@"Cookie"];
    }
    return self;
}

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSMutableURLRequest *)request completionHandler:(void (^)(NSURLResponse *, id, NSError *))completionHandler
{
    return [super dataTaskWithRequest:request completionHandler:completionHandler];
}

- (NSHTTPCookieStorage *)cookieStorage
{
    return [NSHTTPCookieStorage sharedHTTPCookieStorage];
}

@end
