//
//  VideosByCategoryModel.h
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideosByCategoryVideosModel,VideoByCategoryUserModel;
@interface VideosByCategoryModel : BaseModel

@property (nonatomic, strong) NSArray<VideosByCategoryVideosModel *> *videos;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@end


@interface VideosByCategoryVideosModel : BaseModel

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) VideoByCategoryUserModel *user;

@property (nonatomic, assign) NSInteger favoriteCount;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, copy) NSURL *link;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, copy) NSString *publicType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, strong) NSArray *operationLimit;

@property (nonatomic, copy) NSURL *bigThumbnail;//

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *thumbnailV2;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger downCount;

@property (nonatomic, assign) NSInteger upCount;

@end

@interface VideoByCategoryUserModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *link;

@end

