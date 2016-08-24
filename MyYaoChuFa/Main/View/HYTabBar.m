//
//  HYTabBar.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/24.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYTabBar.h"
#import "UIView+Frame.h"

@interface HYTabBar ()

@property (nonatomic,weak) UIButton  * middleBtn;
@end

@implementation HYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{

    [self setBackgroundImage:[UIImage imageNamed:@"home_bottom_tab_bg"]];
    
    UIButton *middleBtn = [[UIButton alloc] init];
    [middleBtn setImage:[UIImage imageNamed:@"tab_bar_around_icon"] forState:UIControlStateNormal];
    [middleBtn setImage:[UIImage imageNamed:@"tab_bar_around_icon_current"] forState:UIControlStateHighlighted];
    middleBtn.size = middleBtn.currentImage.size;
    [middleBtn addTarget:self action:@selector(middleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:middleBtn];
    self.middleBtn = middleBtn;
    
   
}


/**
 *  加号按钮点击
 */
- (void)middleBtnClick
{
    // 通知代理
    if ([self.hy_tabBardelegate respondsToSelector:@selector(tabBarDidClickMiddleButton:)]) {
        [self.hy_tabBardelegate tabBarDidClickMiddleButton:self];
    }
}


/**
 *  想要重新排布系统控件subview的布局，推荐重写layoutSubviews，在调用父类布局后重新排布。
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮的位置
    self.middleBtn.centerX = self.width * 0.5;
    self.middleBtn.centerY = self.height * 0.5;
    
    // 2.设置其他tabbarButton的frame
    CGFloat tabBarButtonW = self.width / 5;
    CGFloat tabBarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置x
            child.left = tabBarButtonIndex * tabBarButtonW;
            // 设置宽度
            child.width = tabBarButtonW;

            // 增加索引
            tabBarButtonIndex++;
            if (tabBarButtonIndex == 2) {
                tabBarButtonIndex++;
            }
        }
    }
    
    for (UITabBarItem * item in self.items) {
//        UITabBarItem * item = self.items[index];
        UIOffset  offset = UIOffsetMake(0, -6);
        [item setTitlePositionAdjustment:offset];
        UIEdgeInsets insets = UIEdgeInsetsMake(2, 0, 0, 0);
        [item setImageInsets:insets];
    }
}


@end
