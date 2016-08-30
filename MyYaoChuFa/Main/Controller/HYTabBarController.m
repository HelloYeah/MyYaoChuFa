//
//  HYTabBarController.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/24.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYTabBarController.h"
#import "ViewController.h"
#import "HYTabBar.h"
#import "HYHomeVC.h"
#define RGBColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface HYTabBarController ()<HYTabBarDelegate>

@end

@implementation HYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVc:[[HYHomeVC alloc] init] title:nil image:@"tab_bar_home_icon" selectedImage:@"tab_bar_home_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"目的地" image:@"tab_bar_around_icon" selectedImage:@"tab_bar_around_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"发现" image:@"tab_bar_discover_icon" selectedImage:@"tab_bar_discover_icon_current"];
    [self addChildVc:[[ViewController alloc] init] title:@"我的" image:@"tab_bar_my_icon" selectedImage:@"tab_bar_my_icon_current"];
 
    
    HYTabBar *tabBar = [[HYTabBar alloc] init];
    // 设置代理
    tabBar.hy_tabBardelegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    // 修改tabBar为自定义tabBar
    [self setValue:tabBar forKey:@"tabBar"];
}
/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBColor(123, 123, 123)} forState:UIControlStateNormal];

    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
}

@end
