//
//  ShowsCollectionViewCell.h
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) TRImageView *iconView;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UIButton *playingBtn;
@property (nonatomic,strong) UILabel *episodeUpdatedLb;
@property (nonatomic,strong) UILabel *lastupdateLb;
@property (nonatomic,strong) UIView *upView;
@end
