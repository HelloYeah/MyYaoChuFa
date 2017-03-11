
//
//  HYTableViewSectionHeader.m
//  MyYaoChuFa
//
//  Created by HelloYeah on 17/3/11.
//  Copyright © 2017年 HY. All rights reserved.
//

#import "HYTableViewSectionHeader.h"
#import "UIView+Frame.h"

@implementation HYTableViewSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if ([super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UILabel *)titleLabel {

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

- (UIImageView *)tagImageView {

    if (!_tagImageView) {
        _tagImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_tagImageView];
    }
    return _tagImageView;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];

    if (_tagImageView) {
        [_tagImageView sizeToFit];
        _tagImageView.left = 0;
    }
    
    if (_titleLabel) {
        [_titleLabel sizeToFit];
        _titleLabel.centerY = self.height * 0.55;
        _titleLabel.left = 15;
        _titleLabel.width = MIN(self.width * 0.5, _titleLabel.width);
    }
    
    if (_subTitleLabel) {
        [_subTitleLabel sizeToFit];
        _subTitleLabel.centerY = self.height * 0.55;
        _subTitleLabel.left = _titleLabel.right + 15;
        _subTitleLabel.width = MIN(self.width * 0.9, _subTitleLabel.right) - _subTitleLabel.left;
    }
}


@end
