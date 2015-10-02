//
//  DIEViewControllerCellTableViewCell.m
//  布丁动画
//
//  Created by cq on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEViewControllerCellTableViewCell.h"

@interface DIEViewControllerCellTableViewCell ()

@end

@implementation DIEViewControllerCellTableViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (UIImageView *)avatorImageView{
    if (_avatorImageView == nil) {
        _avatorImageView = [[UIImageView alloc] init];
        _avatorImageView.layer.cornerRadius = 5;
        _avatorImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatorImageView];
        [_avatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(@(10));
            make.bottom.equalTo(@(-10));
            make.width.equalTo(@(80));
        }];
        [self.contentView addSubview:_avatorImageView];
    }
    return _avatorImageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatorImageView).offset(90);
            make.height.equalTo(@(20));
        }];
    }
    return _titleLabel;
}

- (UILabel *)subTiteLabel{
    if (_subTiteLabel == nil) {
        _subTiteLabel = [[UILabel alloc] init];
        _subTiteLabel.textAlignment = NSTextAlignmentLeft;
        _subTiteLabel.font = [UIFont systemFontOfSize:15];
        _subTiteLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_subTiteLabel];
        [_subTiteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatorImageView).offset(90);
            make.top.equalTo(_subTiteLabel).offset(40);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@(20));
        }];
    }
    return _subTiteLabel;
}

- (UILabel *)statusLabel{
    if (_statusLabel == nil) {
        _statusLabel = [[UILabel alloc] init];
        _statusLabel.textAlignment = NSTextAlignmentLeft;
        _statusLabel.font = [UIFont systemFontOfSize:15];
        _statusLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_statusLabel];
        [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatorImageView).offset(90);
            make.top.equalTo(_statusLabel).offset(40);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@(20));
        }];
    }
    return _statusLabel;
    
}

@end
