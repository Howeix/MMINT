//
//  MMMamCircleTableViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMMamCircleTableViewController.h"
#import "MMMilkPowderTableViewController.h"
#import "MMBabySuppliesTableViewController.h"
#import "MMFoodTableViewController.h"
#import "MMMilkPowderTableViewController.h"
#import "MMOtherTableViewController.h"
#import "MMShareTableViewController.h"
#import "UIView+NHFrame.h"

@interface MMMamCircleTableViewController ()
@property(strong,nonatomic)NSArray *titleViewTexts;
@property(weak,nonatomic)UIButton *previouslyButton;
@property(weak,nonatomic)UIView *underLine;
@property(weak,nonatomic)UIScrollView *titleScrollView;
//** contentScrollView */
@property (weak, nonatomic) UIScrollView *contentScrollView;
@end

@implementation MMMamCircleTableViewController

static NSString * const ID = @"MamCircleCell";

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

    NSLog(@"%@",self.tableView.delegate);
    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0 );
    
    [self setupContentScrollView];
    
    
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


-(void)setupContentScrollView{
    
    [self addChildViewController:[MMBabySuppliesTableViewController new]];
    [self addChildViewController:[MMFoodTableViewController new]];
    [self addChildViewController:[MMMilkPowderTableViewController new]];
    [self addChildViewController:[MMOtherTableViewController new]];
    [self addChildViewController:[MMShareTableViewController new]];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MMScreenW, self.view.frame.size.height)];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = CGSizeMake(MMScreenW * self.titleViewTexts.count, 0);
    scrollView.pagingEnabled = YES;
    self.contentScrollView = scrollView;
    
    NSInteger i = 0;
    for (UIViewController *vc in self.childViewControllers) {
        vc.view.frame = CGRectMake(i * MMScreenW, 0, vc.view.frame.size.width, vc.view.frame.size.height);
        vc.view.backgroundColor = HWRandomColor;
        [scrollView addSubview:vc.view];
        i++;
    }
    [self.tableView addSubview:scrollView];
}

-(void)setupTitleView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, MMScreenW, 44)];
    scrollView.backgroundColor = [UIColor whiteColor];
    CGFloat btnY = 0;
    CGFloat btnWidth = MMScreenW / self.titleViewTexts.count;
    CGFloat btnHeight = 44;
    NSInteger i = 0;
    for (NSString *titleViewText in self.titleViewTexts) {
        CGFloat btnX = btnWidth * i;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [btn setTitle:titleViewText forState:UIControlStateNormal];
        [btn setTitleColor:[[UIColor grayColor] colorWithAlphaComponent:0.7] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = i;
        [scrollView addSubview:btn];
        if (i == 0) [self btnClick:btn];
        i++;
    }
    self.titleScrollView = scrollView;
    [self.navigationController.view addSubview:scrollView];
    [self setupUnderLine];
    
}

-(void)setupUnderLine{
    
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(0, self.titleScrollView.frame.size.height - 5, self.titleScrollView.frame.size.width / 5, 1)];
    lineV.backgroundColor = [UIColor redColor];
    [self.titleScrollView addSubview:lineV];
    self.underLine = lineV;
    
    UIButton *firstBtn = self.titleScrollView.subviews.firstObject;
    firstBtn.selected = YES;
    self.previouslyButton = firstBtn;
    
    self.underLine.NH_width = [firstBtn.currentTitle sizeWithAttributes:@{NSFontAttributeName : firstBtn.titleLabel.font}].width + 10;
    [firstBtn.currentTitle sizeWithAttributes:@{NSFontAttributeName : firstBtn.titleLabel.font}];
    _underLine.NH_centerX = firstBtn.NH_centerX;
}

-(void)btnClick:(UIButton *)btn{
    self.previouslyButton.selected = NO;
    btn.selected = YES;
    self.previouslyButton = btn;
    //scrollView的x值
    CGFloat scrollViewX = btn.tag * MMScreenW;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        //设置下划线的宽度
        self.underLine.NH_width = [btn.currentTitle sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}].width + 10;
        //设置下划线的位置
        [btn.currentTitle sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}];
        _underLine.NH_centerX = btn.NH_centerX;
        self.contentScrollView.contentOffset = CGPointMake(scrollViewX, self.contentScrollView.contentOffset.y);
        
    }completion:^(BOOL finished) {
        [self addViewIntoScrollView:btn.tag];
    }];
}

#pragma mark - 抽取获得索引子控制器view的方法
-(void)addViewIntoScrollView:(NSInteger)index{
    //当点击按钮完成后来到这里创建对应索引控制器的view 并添加到scrollView当中
    //    NSInteger index = titleButton.tag;
    UIViewController *currentVC = self.childViewControllers[index];
    //判断是否已经有加载过了
    if (currentVC.isViewLoaded) return;
    currentVC.view.frame = CGRectMake(index * _titleScrollView.NH_width, 0, _titleScrollView.NH_width, _titleScrollView.NH_height);
    [_titleScrollView addSubview:currentVC.view];
    
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return 100;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 50;
//}
//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
//
//    return cell;
//}

@end
