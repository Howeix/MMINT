//
//  NHTools.h
//  Demo0322
//
//  Created by 黄炜 on 2018/3/22.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHTools : NSObject
@property (strong, nonatomic) NSString *name;

+(void)sendGetRequest:(NSURLRequest *)request withSucess:(void(^)(NSDictionary *dict))sucess orFailure:(void(^)(NSError *error))fail;

+(NSURLRequest *)toolsRequestWithString:(NSString *)str;

@end




