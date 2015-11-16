//
//  CategoryCollectionViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryCollectionViewCell.h"

@implementation CategoryCollectionViewCell
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.numberOfLines = 2;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_equalTo(0);
            make.height.mas_equalTo(20);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _nameLb;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(_nameLb.mas_top).mas_equalTo(0);
        }];
    }
    return _iconView;
}
@end
