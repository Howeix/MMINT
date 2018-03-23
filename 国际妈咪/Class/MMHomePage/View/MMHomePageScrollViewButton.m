//
//  MMHomePageScrollViewButton.m
//  国际妈咪
//
//  Created by 黄炜 on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMHomePageScrollViewButton.h"

@implementation MMHomePageScrollViewButton

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor grayColor];
    
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MMHomePageScrollViewButton class]) owner:nil options:nil][0];
        self.frame = CGRectMake(0, 0, 44, 44);
    }
    return self;
}

@end
