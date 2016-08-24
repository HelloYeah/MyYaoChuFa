//
//  HYTabBar.h
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/24.
//  Copyright © 2016年 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTabBar;

@protocol HYTabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickMiddleButton:(HYTabBar *)tabBar;

@end

@interface HYTabBar : UITabBar

@property (nonatomic, weak) id<HYTabBarDelegate> hy_tabBardelegate;

@end
