//
//  HYScenicTableViewCell.m
//  MyYaoChuFa
//
//  Created by HelloYeah on 17/3/11.
//  Copyright © 2017年 HY. All rights reserved.
//

#import "HYScenicTableViewCell.h"
#import "UIView+Frame.h"

#define kScenicImageHeight  130
#define kTitleHeight  20
@interface HYScenicTableViewCell ()
@property (strong, nonatomic) UIImageView *scenicImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *topContentView;
@property (strong, nonatomic) UIView *bottomContentView;
@end

@implementation HYScenicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.topContentView];
        [self.contentView addSubview:self.bottomContentView];
    }
    return self;
}

- (void)setImageName:(NSString *)imageName {

    _imageName = imageName;
    self.scenicImageView.image = [UIImage imageNamed:imageName];
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    _titleLabel.text = title;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(self.width, CGFLOAT_MAX)];
    _titleLabel.top = self.scenicImageView.bottom;
    _titleLabel.height = 20;
}

- (UIView *)topContentView {
    
    if (!_topContentView) {
        _topContentView = [[UIView alloc] init];
        [_topContentView addSubview:self.scenicImageView];
        [_topContentView addSubview:self.titleLabel];
    }
    return _topContentView;
}

- (UIView *)bottomContentView {
    
    if (!_bottomContentView) {
        _bottomContentView = [[UIView alloc] init];
    }
    return _bottomContentView;
}

- (UIImageView *)scenicImageView {

    if (!_scenicImageView) {
        _scenicImageView = [[UIImageView alloc] init];
        _scenicImageView.height = kScenicImageHeight;
        _scenicImageView.width = [UIScreen mainScreen].bounds.size.width;
    }
    return _scenicImageView;
}

- (UILabel *)titleLabel {

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 2;
        _titleLabel.width = [UIScreen mainScreen].bounds.size.width;
    }
    return _titleLabel;
}

@end
