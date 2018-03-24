//
//  MMFindGoodsViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMFindGoodsViewController.h"
#import "MMFindGoodsScrollViewButton.h"
#import "UIView+NHFrame.h"
#import "MMGoodsView.h"

@interface MMFindGoodsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *findGoodsScrollView;
//** 按钮文字  用字典 */
@property (strong, nonatomic) NSArray *buttonTexts;
@property(strong,nonatomic)NSArray *goodsViews;

@end

@implementation MMFindGoodsViewController

-(NSArray *)buttonTexts{
    if (!_buttonTexts) {
        _buttonTexts = @[@{@"海外奶粉":@"milk powder"},@{@"纸尿裤":@"diapers"},@{@"童装童鞋":@"kids"},@{@"辅食/营养":@"food/nutrition"},@{@"婴幼用品":@"baby supplies"},@{@"海外生活":@"Appliance"},@{@"海外保健品":@"Health"},@{@"海外美妆":@"Beauty"},@{@"妈妈用品":@"Mommy"}];
    }
    return _buttonTexts;
}

-(NSArray *)goodsViews{
    if (!_goodsViews) {
        _goodsViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MMGoodsView class]) owner:nil options:nil];
    }
    return _goodsViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.findGoodsScrollView.contentSize = CGSizeMake(self.findGoodsScrollView.frame.size.width, 600);
    self.findGoodsScrollView.showsVerticalScrollIndicator = NO;
    self.findGoodsScrollView.showsHorizontalScrollIndicator = NO;
    
    [self setupFindGoodsScrollViewButton];
    [self setupNavBar];
//    NSLog(@"%zd",self.buttonTexts.count);
    
    
}

-(void)setupNavBar{
    self.navigationItem.titleView = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, MMScreenW - 40, 40)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeInfoDark];
    btn.frame = CGRectMake(0, 0, 40, 40);
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

-(void)setupFindGoodsScrollViewButton{
    
    CGFloat btnX = 0;
    
    CGFloat btnWidth = self.findGoodsScrollView.frame.size.width;
    CGFloat btnHeight = 60;
    
    NSInteger i = 0;
    for (NSDictionary *buttonText in self.buttonTexts) {
        CGFloat btnY = i * btnHeight;
        
        MMFindGoodsScrollViewButton *btn = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MMFindGoodsScrollViewButton class]) owner:nil options:nil][1];
        NSLog(@"%@",btn.class);
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        UILabel *cnLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 12, 100, 21)];
        cnLabel.text = buttonText.allKeys[0];
        cnLabel.font = [UIFont systemFontOfSize:15];
        cnLabel.textColor = [UIColor darkGrayColor];
        cnLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *enLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, 100, 21)];
        enLabel.text = buttonText.allValues[0];
        enLabel.textAlignment = NSTextAlignmentCenter;
        enLabel.font = [UIFont systemFontOfSize:12];
        enLabel.textColor = [UIColor darkGrayColor];
        
        [btn addSubview:cnLabel];
        [btn addSubview:enLabel];
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = i;
        
//        btn.chineseLabel.text = buttonText.allKeys[0];
//        btn.englishLabel.text = buttonText.allValues[0];
//        btn.backgroundColor = self.findGoodsScrollView.backgroundColor;
//#warning 必须设置这里不然无法设置从xib加载出来view的frame.size
//        btn.autoresizingMask = UIViewAutoresizingNone;
//        btn.userInteractionEnabled = YES;
        [self.findGoodsScrollView addSubview:btn];
        i++;
    }
    
    
}




-(void)clickBtn:(MMFindGoodsScrollViewButton *)btn{
    MMGoodsView *v = self.goodsViews[btn.tag];
    
    
    [self.view insertSubview:v belowSubview:self.findGoodsScrollView];
    
}

@end
