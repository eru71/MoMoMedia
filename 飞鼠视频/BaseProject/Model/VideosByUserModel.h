//
//  VideosByUserModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideosByUserVideosModel;
@interface VideosByUserModel : BaseModel

@property (nonatomic, strong) NSArray<VideosByUserVideosModel *> *videos;

@property (nonatomic, copy) NSString *lastItem;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@end

#pragma mark - VideosModel
@interface VideosByUserVideosModel : BaseModel

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *publicType;

@property (nonatomic, assign) NSInteger favoriteCount;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger isinteract;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, strong) NSArray *operationLimit;

@property (nonatomic, assign) NSInteger downCount;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, assign) NSInteger upCount;

@end

