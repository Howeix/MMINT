//
//  UIImage+ImageOriginal.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "UIImage+ImageOriginal.h"

@implementation UIImage (ImageOriginal)

+(UIImage *)imageWithOriginal:(NSString *)imageName{
    return [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
