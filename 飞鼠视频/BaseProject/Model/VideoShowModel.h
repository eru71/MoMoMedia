//
//  VideoShowModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoShowUserModel,VideoShowSourceModel;

#pragma mark - VideoShowModel
@interface VideoShowModel : BaseModel

@property (nonatomic, copy) NSString *publicType;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, strong) VideoShowSourceModel *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *copyrightType;

@property (nonatomic, copy) NSString *bigThumbnail;     //

@property (nonatomic, copy) NSString *upTount;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) VideoShowUserModel *user;

@property (nonatomic, copy) NSString *player;

@property (nonatomic, copy) NSString *downCount;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, strong) NSArray *operationLimit;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, copy) NSString *favoriteCount;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *desc; //


@end

#pragma mark - VideoShowUserModel
@interface VideoShowUserModel : BaseModel

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *link;

@end

#pragma mark - VideoShowSourceModel
@interface VideoShowSourceModel : BaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *link;

@end

