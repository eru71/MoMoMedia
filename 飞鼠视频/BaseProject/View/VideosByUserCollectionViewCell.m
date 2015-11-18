//
//  VideosByUserCollectionViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserCollectionViewCell.h"

@interface VideosByUserCollectionViewCell()


@end

@implementation VideosByUserCollectionViewCell

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:15];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.numberOfLines = 2;
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
//            make.bottom.mas_equalTo(self.episodeUpdatedLb.mas_top).mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_equalTo(0);
            make.height.mas_lessThanOrEqualTo(30);
            make.height.mas_greaterThanOrEqualTo(20);
        }];
    }
    return _title;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.bottom.mas_equalTo(_title.mas_top).mas_equalTo(0);
        }];
    }
    return _iconView;
}

-(UIView *)lightGrayView{
    if (!_lightGrayView) {
        _lightGrayView = [UIView new];
        [self.iconView addSubview:_lightGrayView];
        _lightGrayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [_lightGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
    return _lightGrayView;
}

- (UILabel *)publishedLb {
    if(_publishedLb == nil) {
        _publishedLb = [[UILabel alloc] init];
        [self.lightGrayView addSubview:_publishedLb];
        _publishedLb.font = [UIFont systemFontOfSize:13];
        _publishedLb.textColor = [UIColor whiteColor];
        [_publishedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.top.mas_equalTo(0);
            make.right.mas_equalTo(100);
        }];
    }
    return _publishedLb;
}

-(UILabel *)viewCountLb{
    if (_viewCountLb == nil) {
        _viewCountLb = [[UILabel alloc]init];
        _viewCountLb.textColor = [UIColor whiteColor];
        _viewCountLb.font = [UIFont systemFontOfSize:13];
        [self.lightGrayView addSubview:_viewCountLb];
        [_viewCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(5);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(100);
        }];
    }
    return _viewCountLb;
}

@end
