//
//  VideosCollectionViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) TRImageView *iconView;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UIButton *playingBtn;

@property (nonatomic,strong) UILabel *lastupdateLb;
@property (nonatomic,strong) UIView *upView;
@end
