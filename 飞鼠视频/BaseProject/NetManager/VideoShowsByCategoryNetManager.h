//
//  VideoShowsByCategoryNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "GenreModel.h"
@interface VideoShowsByCategoryNetManager : BaseNetManager

typedef NS_ENUM(NSUInteger, VideoAnimeShowsType) {
    VideoAnimeShowsTypeAll,
    VideoAnimeShowsTypeReasoning,
    VideoAnimeShowsTypeCollege,
    VideoAnimeShowsTypeFighting,
    VideoAnimeShowsTypeEducation,
};

//+ (id)getAnimeWithType:(VideoAnimeShowsType)type Page:(NSInteger)page kCompletionHandle;

+ (id)getAnimeWithPage:(NSInteger)page kCompletionHandle;

+ (id)getAnimeWithMainType:(NSString *)type Page:(NSInteger)page kCompletionHandle;

+ (id)getCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle;


@end
