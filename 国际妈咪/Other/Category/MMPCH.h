//
//  MMPCH.h
//  国际妈咪
//
//  Created by 黄炜 on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#ifndef MMPCH_h
#define MMPCH_h

#define MMScreenW [UIScreen mainScreen].bounds.size.width
#define MMScreenH [UIScreen mainScreen].bounds.size.height
//设置自定义颜色
#define HWColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
//随机颜色
#define HWRandomColor HWColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#endif /* MMPCH_h */
