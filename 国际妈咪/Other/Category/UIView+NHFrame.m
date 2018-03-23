//
//  UIView+NHFrame.m
//  Demo0322
//
//  Created by 黄炜 on 2018/3/22.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "UIView+NHFrame.h"



@implementation UIView (NHFrame)

-(CGFloat)NH_x{
    return self.frame.origin.x;
}
-(CGFloat)NH_y{
    return self.frame.origin.y;
}
-(CGFloat)NH_width{
    return self.frame.size.width;
}
-(CGFloat)NH_height{
    return self.frame.size.height;
}
-(CGFloat)NH_centerX{
    return self.center.x;
}
-(CGFloat)NH_centerY{
    return  self.center.y;
}


-(void)setNH_x:(CGFloat)NH_x{
    CGRect rect = self.frame;
    rect.origin.x = NH_x;
    self.frame = rect;
}
-(void)setNH_y:(CGFloat)NH_y{
    CGRect rect = self.frame;
    rect.origin.y = NH_y;
    self.frame = rect;
}
-(void)setNH_width:(CGFloat)NH_width{
    CGRect rect = self.frame;
    rect.size.width = NH_width;
    self.frame = rect;
}
-(void)setNH_height:(CGFloat)NH_height{
    CGRect rect = self.frame;
    rect.size.height = NH_height;
    self.frame = rect;
}
-(void)setNH_centerX:(CGFloat)NH_centerX{
    CGPoint point = self.center;
    point.x = NH_centerX;
    self.center = point;
}
-(void)setNH_centerY:(CGFloat)NH_centerY{
    CGPoint point = self.center;
    point.y = NH_centerY;
    self.center = point;
}

@end
