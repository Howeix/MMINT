//
//  MMFindGoodsScrollViewButtonView.m
//  国际妈咪
//
//  Created by 黄炜 on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMFindGoodsScrollViewButtonView.h"

@implementation MMFindGoodsScrollViewButtonView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.chineseLabel.textColor = [UIColor darkGrayColor];
    self.englishLabel.textColor = [UIColor darkGrayColor];
}

//-(void)drawRect:(CGRect)rect{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
//    CGContextAddPath(ctx, path.CGPath);
//    CGContextStrokePath(ctx);
//}



@end
