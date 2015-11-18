//
//  SearchByKeywordModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class SearchByKeywordVideosModel,SearchByKeywordVideosUserModel;
@interface SearchByKeywordModel : BaseModel

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSArray<SearchByKeywordVideosModel *> *videos;

@end

#pragma mark - SearchByKeywordVideosModel
@interface SearchByKeywordVideosModel : BaseModel

@property (nonatomic, copy) NSURL *thumbnail;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSURL *link;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSURL *thumbnailV2;

@property (nonatomic, copy) NSString *upCount;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *paid;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) SearchByKeywordVideosUserModel *user;

@property (nonatomic, copy) NSString *downCount;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, strong) NSArray *operationLimit;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, copy) NSString *favoriteCount;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *publicType;

@end

#pragma mark - SearchByKeywordVideosUserModel
@interface SearchByKeywordVideosUserModel : BaseModel

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSURL *link;

@end

