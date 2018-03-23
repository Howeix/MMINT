//
//  UIView+NHFrame.h
//  Demo0322
//
//  Created by 黄炜 on 2018/3/22.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (NHFrame)

/* !!!!!!注意这里@property并不会生成一个加_的成员变量,只会生成getter setter方法 */

//** x */
@property CGFloat NH_x;
//** y */
@property CGFloat NH_y;
//** width */
@property CGFloat NH_width;
//** height */
@property CGFloat NH_height;
//** centerX */
@property CGFloat NH_centerX;
//** centerY */
@property CGFloat NH_centerY;



@end
