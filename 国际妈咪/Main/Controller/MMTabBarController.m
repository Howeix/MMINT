//
//  MMTabBarController.m
//  国际妈咪
//
//  Created by Jerry Huang on 2018/3/23.
//  Copyright © 2018年 Jerry Huang. All rights reserved.
//

#import "MMTabBarController.h"
#import "MMNavigationController.h"
#import "MMShoppingBagTableViewController.h"
#import "MMMamCircleTableViewController.h"
#import "MMFindGoodsViewController.h"
#import "MMMeTableViewController.h"
#import "MMHomePageTableViewController.h"
#import "UIImage+ImageOriginal.h"

@interface MMTabBarController ()

@end

@implementation MMTabBarController

+(void)initialize{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attrsSelect = [NSMutableDictionary dictionary];
    attrsSelect[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:attrsSelect forState:UIControlStateSelected];
    
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupAllViewController];
    [self setupAllChildViewController];
    [self setupAllTitleButton];
}



-(void)setupAllChildViewController{
    
    MMHomePageTableViewController *homePageVC = [[MMHomePageTableViewController alloc] init];
    MMNavigationController *nav1 = [[MMNavigationController alloc] initWithRootViewController:homePageVC];
    [self addChildViewController:nav1];

    MMFindGoodsViewController *findGoodsVC = [[MMFindGoodsViewController alloc] init];
    MMNavigationController *nav2 = [[MMNavigationController alloc] initWithRootViewController:findGoodsVC];
    [self addChildViewController:nav2];
    
    MMMamCircleTableViewController *mamCircleVC = [[MMMamCircleTableViewController alloc] init];
    MMNavigationController *nav3 = [[MMNavigationController alloc] initWithRootViewController:mamCircleVC];
    [self addChildViewController:nav3];
    
    MMShoppingBagTableViewController *shoppingBagVC = [[MMShoppingBagTableViewController alloc] init];
    MMNavigationController *nav4 = [[MMNavigationController alloc] initWithRootViewController:shoppingBagVC];
    [self addChildViewController:nav4];
    
    MMMeTableViewController *meVC = [[MMMeTableViewController alloc] init];
    MMNavigationController *nav5 = [[MMNavigationController alloc] initWithRootViewController:meVC];
    [self addChildViewController:nav5];
}

-(void)setupAllTitleButton{
    
    MMNavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"首页";
//    nav.tabBarItem.image = [UIImage imageNamed:nil];
//    nav.tabBarItem.selectedImage = [UIImage imageNamed:nil];
    
    MMNavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"发现商品";
    
    
    MMNavigationController *nav2 = self.childViewControllers[2];
    nav2.tabBarItem.title = @"妈咪圈";
    
    MMNavigationController *nav3 = self.childViewControllers[3];
    nav3.tabBarItem.title = @"购物袋";
    
    
    MMNavigationController *nav4 = self.childViewControllers[4];
    nav4.tabBarItem.title = @"我的";
    
    // 0:精华
//    UINavigationController *nav = self.childViewControllers[0];
//    nav.tabBarItem.title = @"精华";
//    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
//    nav.tabBarItem.selectedImage = [UIImage imageWithOriginal:];
//
//    // 1:新帖
//    UINavigationController *nav1 = self.childViewControllers[1];
//    nav1.tabBarItem.title = @"新帖";
//    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
//    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
//
//    // 3.关注
//    UINavigationController *nav3 = self.childViewControllers[2];
//    nav3.tabBarItem.title = @"关注";
//    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
//    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
//
//    // 4.我
//    UINavigationController *nav4 = self.childViewControllers[3];
//    nav4.tabBarItem.title = @"我";
//    nav4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
//    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
    
    
    
}


@end
