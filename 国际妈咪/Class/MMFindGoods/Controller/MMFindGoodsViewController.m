//
//  MMFindGoodsViewController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMFindGoodsViewController.h"
#import "MMFindGoodsScrollViewButtonView.h"

@interface MMFindGoodsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *findGoodsScrollView;
//** 按钮文字  用字典 */
@property (strong, nonatomic) NSArray *buttonTexts;


@end

@implementation MMFindGoodsViewController

-(NSArray *)buttonTexts{
    if (!_buttonTexts) {
        _buttonTexts = @[@{@"海外奶粉":@"milk powder"},@{@"纸尿裤":@"diapers"},@{@"童装童鞋":@"kids"},@{@"辅食/营养":@"food/nutrition"},@{@"婴幼用品":@"baby supplies"},@{@"海外生活":@"Appliance"},@{@"海外保健品":@"Health"},@{@"海外美妆":@"Beauty"},@{@"妈妈用品":@"Mommy"}];
    }
    return _buttonTexts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.findGoodsScrollView.contentSize = CGSizeMake(self.findGoodsScrollView.frame.size.width, 800);
    self.findGoodsScrollView.showsVerticalScrollIndicator = NO;
    self.findGoodsScrollView.showsHorizontalScrollIndicator = NO;
    
    [self setupFindGoodsScrollViewButton];
//    NSLog(@"%zd",self.buttonTexts.count);
}

-(void)setupFindGoodsScrollViewButton{
    
    CGFloat btnX = 0;
    
    CGFloat btnWidth = self.findGoodsScrollView.frame.size.width;
    CGFloat btnHeight = 14;
    
    NSInteger i = 0;
    for (NSDictionary *buttonText in self.buttonTexts) {
        CGFloat btnY = i * btnHeight;
        
        MMFindGoodsScrollViewButtonView *btn = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MMFindGoodsScrollViewButtonView class]) owner:nil options:nil][0];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        btn.chineseLabel.text = buttonText.allKeys[0];
        btn.chineseLabel.textColor = [UIColor blueColor];
        btn.englishLabel.text = buttonText.allValues[0];
        btn.englishLabel.textColor = [UIColor blueColor];
        [self.findGoodsScrollView addSubview:btn];
        
        i++;
    }
    
    
}

@end
