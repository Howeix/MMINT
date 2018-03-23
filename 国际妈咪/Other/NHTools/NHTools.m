//
//  NHTools.m
//  Demo0322
//
//  Created by 黄炜 on 2018/3/22.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "NHTools.h"

@interface NHTools ()

@end

@implementation NHTools

+(void)sendGetRequest:(NSURLRequest *)request withSucess:(void(^)(NSDictionary *dict))sucess orFailure:(void(^)(NSError * _Nullable error))fail{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) { //URL头部不对
                fail(error);
                return;
            }else{
                NSLog(@"URL地址有误!");
            };
            sucess([NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]);
        }];
        [task resume];
    });
}
/**
 provide a prarameter(str) and return a NSURLRequest objc

 @param str NSString objc
 @return NSURLRequest objc
 */
+(NSURLRequest *)toolsRequestWithString:(NSString *)str{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
}





@end






