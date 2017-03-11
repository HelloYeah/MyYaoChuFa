//
//  HYScenicTableViewCell.h
//  MyYaoChuFa
//
//  Created by HelloYeah on 17/3/11.
//  Copyright © 2017年 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYScenicTableViewCell : UITableViewCell

@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray<NSString *> *flags;

@end
