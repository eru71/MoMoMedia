//
//  VideosByUserCollectionViewCell.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserCollectionViewCell.h"

@implementation VideosByUserCollectionViewCell

+(instancetype)cellForTableView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{
    VideosByUserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:253/255 green:233/255 blue:222/255 alpha:0.5];
    
    return cell;
}

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(30);
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(5);
        }];
    }
    return _iconView;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        _title.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_iconView.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(5);
        }];
    }
    return _title;
}

- (UIView *)lightGrayView {
    if(_lightGrayView == nil) {
        _lightGrayView = [[UIView alloc] init];
        [self.iconView addSubview:_lightGrayView];
        _lightGrayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [_lightGrayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.top.mas_equalTo(0);
            make.right.left.mas_equalTo(0);
        }];
        
    }
    return _lightGrayView;
}

- (UILabel *)publishedLb {
    if(_publishedLb == nil) {
        _publishedLb = [[UILabel alloc] init];
        [_lightGrayView addSubview:_publishedLb];
        _publishedLb.backgroundColor = [UIColor whiteColor];
        [_publishedLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(_viewCountLb.mas_left).mas_equalTo(0);
        }];
    }
    return _publishedLb;
}

-(UILabel *)viewCountLb{
    if (_viewCountLb == nil) {
        _viewCountLb = [[UILabel alloc]init];
        _viewCountLb.backgroundColor = [UIColor whiteColor];
        [_lightGrayView addSubview:_viewCountLb];
        [_viewCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(5);
            make.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(70);
        }];
    }
    return _viewCountLb;
}

@end
