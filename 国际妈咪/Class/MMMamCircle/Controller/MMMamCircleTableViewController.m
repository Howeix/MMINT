//
//  MMMamCircleTableViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMMamCircleTableViewController.h"

@interface MMMamCircleTableViewController ()
@property(strong,nonatomic)NSArray *titleViewTexts;
@property(strong,nonatomic)UIButton *previouslyButton;
@end

@implementation MMMamCircleTableViewController

-(NSArray *)titleViewTexts{
    if (!_titleViewTexts) {
        _titleViewTexts = @[@"奶粉",@"辅食",@"婴用",@"其他",@"分享"];
    }
    return _titleViewTexts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"妈咪圈";
    
    [self setupNav];
    
    [self setupTitleView];
    
    
    
    
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

-(void)setupTitleView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MMScreenW, 44)];
    scrollView.backgroundColor = [UIColor grayColor];
    CGFloat btnY = 0;
    CGFloat btnWidth = MMScreenW / self.titleViewTexts.count;
    CGFloat btnHeight = 44;
    NSInteger i = 0;
    for (NSString *titleViewText in self.titleViewTexts) {
        CGFloat btnX = btnWidth * i;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [btn setTitle:titleViewText forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:btn];
        if (i == 0) [self btnClick:btn];
        i++;
    }
    [self.view addSubview:scrollView];
}

-(void)btnClick:(UIButton *)btn{
        self.previouslyButton.selected = NO;
        btn.selected = YES;
        self.previouslyButton = btn;

    
}

@end
