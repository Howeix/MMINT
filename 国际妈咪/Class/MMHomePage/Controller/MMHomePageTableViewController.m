//
//  MMHomePageTableViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMHomePageTableViewController.h"
#import "UIView+NHFrame.h"
#import "NHTools.h"
#import "MMHomePageScrollViewButton.h"

@interface MMHomePageTableViewController ()

@end

@implementation MMHomePageTableViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //请求网络数据 ...

}

-(NSArray *)titleViewItems{
    if (!_titleViewItems) {
        _titleViewItems = @[@"妈咪热点",@"海外奶粉",@"纸尿裤",@"童装童鞋",@"海外辅食",@"海外婴用",@"海外保健",@"海外美妆",@"海外生活",@"海外妈咪"];
    }
    return _titleViewItems;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setupTitleView];
    
    [self setupHeaderBannerView];
    

    
    self.view.backgroundColor = [UIColor grayColor];
    
}

-(void)setupHeaderBannerView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -200, MMScreenW, 200)];
    scrollView.backgroundColor = [UIColor redColor];
    
    
    
    [self.view addSubview:scrollView];
    
}

-(void)setupTitleView{
    
    //添加titleview右边按钮
    MMHomePageScrollViewButton *btn = [[MMHomePageScrollViewButton alloc] init];
    btn.NH_x = MMScreenW - 44;
    btn.NH_y = 64;
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = CGRectMake(0, 64, MMScreenW - 44, 44);
    scrollView.contentSize = CGSizeMake(750, 44);
    [self.navigationController.view addSubview:scrollView];
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.navigationController.view insertSubview:btn aboveSubview:scrollView];
    
    CGFloat categoryBtnY = 0;
    CGFloat categoryBtnWidth = scrollView.contentSize.width / 10;
    CGFloat categoryBtnHeight = 44;
    
    NSInteger i = 0;
    //初始化titleView分类按钮
    for (NSString *buttonName in self.titleViewItems) {
        CGFloat categoryBtnX = i * categoryBtnWidth;
        UIButton *categoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        categoryBtn.frame = CGRectMake(categoryBtnX, categoryBtnY, categoryBtnWidth, categoryBtnHeight);
        [categoryBtn addTarget:self action:@selector(categoryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        categoryBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        categoryBtn.titleLabel.textColor = [UIColor blackColor];
        [categoryBtn setTitle:buttonName forState:UIControlStateNormal];
        [scrollView addSubview:categoryBtn];
        i++;
    }
    
}

-(void)categoryBtnClick:(UIButton *)categoryBtn{
    
    NSLog(@"%@",categoryBtn.titleLabel.text);
}


@end
