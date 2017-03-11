//
//  HYTabBarController.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/24.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYTabBarController.h"
#import "ViewController.h"
#import "HYHomeVC.h"

#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface HYTabBarController ()

@end

@implementation HYTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addChildVc:[[HYHomeVC alloc] init] title:@"首页" image:@"tab_bar_home_icon" selectedImage:@"tab_bar_home_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"目的地" image:@"tab_bar_around_icon" selectedImage:@"tab_bar_around_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"发现" image:@"tab_bar_discover_icon" selectedImage:@"tab_bar_discover_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"我的" image:@"tab_bar_my_icon" selectedImage:@"tab_bar_my_icon_current"];
 
}


/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{

    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBColor(123, 123, 123)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navigationVc];
}

@end
