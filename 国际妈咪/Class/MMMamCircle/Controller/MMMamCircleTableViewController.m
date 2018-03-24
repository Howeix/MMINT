//
//  MMMamCircleTableViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMMamCircleTableViewController.h"
#import "MMMilkPowderTableViewController.h"

@interface MMMamCircleTableViewController ()
@property(strong,nonatomic)NSArray *titleViewTexts;
@property(strong,nonatomic)UIButton *previouslyButton;
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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MMScreenW, self.view.frame.size.height)];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = CGSizeMake(MMScreenW * self.titleViewTexts.count, MMScreenH - 64);
    [self.view addSubview:scrollView];
    
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
        [scrollView addSubview:btn];
        if (i == 0) [self btnClick:btn];
        i++;
    }
    [self.navigationController.view addSubview:scrollView];
}

-(void)btnClick:(UIButton *)btn{
        self.previouslyButton.selected = NO;
        btn.selected = YES;
        self.previouslyButton = btn;

    
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
