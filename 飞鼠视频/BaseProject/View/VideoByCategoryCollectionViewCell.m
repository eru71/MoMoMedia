//
//  VideoByCategoryCollectionViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoByCategoryCollectionViewCell.h"
@interface VideoByCategoryCollectionViewCell ()

@end


@implementation VideoByCategoryCollectionViewCell


-(TRImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [TRImageView new];
        //        [_iconImageView.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.title]]];
        [_iconImageView.imageView setBackgroundColor:[UIColor colorWithRed:0.113 green:0.816 blue:0.919 alpha:1.000]];
        
        [self.contentView addSubview:_iconImageView];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(self.titleLb.mas_top).mas_equalTo(0);
        }];
        
        
    }
    return _iconImageView;
}

-(UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(5);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        
    }
    return _titleLb;
}

@end
