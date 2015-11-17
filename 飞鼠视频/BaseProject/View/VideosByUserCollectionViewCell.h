//
//  VideosByUserCollectionViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosByUserCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) TRImageView *iconView;

@property (nonatomic,strong) UILabel *title;

@property (nonatomic,strong) UIView *lightGrayView;

@property (nonatomic,strong) UILabel *publishedLb;

@property (nonatomic,strong) UILabel *viewCountLb;



@end
