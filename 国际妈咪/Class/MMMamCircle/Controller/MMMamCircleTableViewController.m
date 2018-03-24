//
//  MMMamCircleTableViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMMamCircleTableViewController.h"

@interface MMMamCircleTableViewController ()

@end

@implementation MMMamCircleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"妈咪圈";
    
    [self setupNav];
    
    
}

-(void)setupNav{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    rightBtn.backgroundColor = [UIColor yellowColor];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    leftBtn.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

@end
