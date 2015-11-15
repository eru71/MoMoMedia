//
//  CategoryVideoModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CategoryVideoVideosModel,CategoryVideoVideosUserModel;
@interface CategoryVideoModel : BaseModel

@property (nonatomic, strong) NSArray<CategoryVideoVideosModel *> *videos;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@end
@interface CategoryVideoVideosModel : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, strong) CategoryVideoVideosUserModel *user;

@property (nonatomic, assign) NSInteger favorite_count;

@property (nonatomic, copy) NSString *published;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, strong) NSArray<NSString *> *streamtypes;

@property (nonatomic, copy) NSString *public_type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger view_count;

@property (nonatomic, strong) NSArray<NSString *> *operation_limit;

@property (nonatomic, copy) NSString *bigThumbnail;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *thumbnail_v2;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, assign) NSInteger down_count;

@property (nonatomic, assign) NSInteger up_count;

@end

@interface CategoryVideoVideosUserModel : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *link;

@end

