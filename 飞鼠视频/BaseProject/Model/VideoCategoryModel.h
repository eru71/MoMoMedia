//
//  VideoCategoryModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoCategoryShowsModel;
@interface VideoCategoryModel : BaseModel

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSArray<VideoCategoryShowsModel *> *shows;

@end

#pragma mark - VideoCategoryShowsModel
@interface VideoCategoryShowsModel : BaseModel

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSURL *link;

@property (nonatomic, assign) NSInteger completed;

@property (nonatomic, assign) CGFloat score;

@property (nonatomic, copy) NSString *released;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSURL *playLink;

@property (nonatomic, copy) NSURL *lastPlayLink;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *lastupdate;

@property (nonatomic, assign) NSInteger paid;

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSURL *poster;

@property (nonatomic, assign) NSInteger episodeUpdated;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, strong) NSArray<NSString *> *hasvideotype;

@property (nonatomic, assign) NSInteger episodeCount;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, assign) NSInteger favoriteCount;

@property (nonatomic, assign) NSInteger commentCount;

@end

