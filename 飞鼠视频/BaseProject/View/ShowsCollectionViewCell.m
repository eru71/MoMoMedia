//
//  ShowsCollectionViewCell.m
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowsCollectionViewCell.h"

@implementation ShowsCollectionViewCell

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textAlignment = NSTextAlignmentLeft;
        _nameLb.numberOfLines = 2;
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(5);
            make.bottom.mas_equalTo(self.episodeUpdatedLb.mas_top).mas_equalTo(0);
            make.top.mas_equalTo(self.iconView.mas_bottom).mas_equalTo(0);
            make.height.mas_lessThanOrEqualTo(30);
            make.height.mas_greaterThanOrEqualTo(20);
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


- (UIButton *)playingBtn {
    if(_playingBtn == nil) {
        _playingBtn = [[UIButton alloc] init];
        [_playingBtn setBackgroundImage:[UIImage imageNamed:@"btn_prelisten_play"] forState:UIControlStateNormal];
        [self.iconView addSubview:_playingBtn];
        //        _playingBtn.tag = 100;
        [_playingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(25);
            make.width.mas_equalTo(25);
        }];
    }
    return _playingBtn;
}

- (UILabel *)episodeUpdatedLb {
    if(_episodeUpdatedLb == nil) {
        _episodeUpdatedLb = [[UILabel alloc] init];
        [self.contentView addSubview:_episodeUpdatedLb];
        _episodeUpdatedLb.font = [UIFont systemFontOfSize:12];
        [_episodeUpdatedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLb.mas_bottom).mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.height.mas_equalTo(15);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _episodeUpdatedLb;
}

-(UIView *)upView{
    if (!_upView) {
        _upView = [UIView new];
        [self.iconView addSubview:_upView];
        _upView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [_upView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
    }
    return _upView;
}

- (UILabel *)lastupdateLb {
    if(_lastupdateLb == nil) {
        _lastupdateLb = [[UILabel alloc] init];
        [self.upView addSubview:_lastupdateLb];
        _lastupdateLb.font = [UIFont systemFontOfSize:10];
        _lastupdateLb.textColor = [UIColor whiteColor];
        [_lastupdateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.top.mas_equalTo(0);
            make.left.mas_equalTo(5);
            //            make.height.mas_equalTo(20);
        }];
    }
    return _lastupdateLb;
}

@end
