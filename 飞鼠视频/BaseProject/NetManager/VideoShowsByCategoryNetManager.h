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

typedef NS_ENUM(NSUInteger, VideoByCategoryType) {
    VideoByCategoryTypeAll,
    VideoByCategoryTypeSoapopera,
    VideoByCategoryTypeFilm,
    VideoByCategoryTypeVariety,
    VideoByCategoryTypeAnime,
    VideoByCategoryTypeMusic,
    VideoByCategoryTypeEducation,
    VideoByCategoryTypeDocumentary,
    VideoByCategoryTypeInfo,
    VideoByCategoryTypeRecreation,
    VideoByCategoryTypeSports,
    VideoByCategoryTypeCar,
    VideoByCategoryTypeTechnology,
    VideoByCategoryTypeGame,
    VideoByCategoryTypeLive,
    VideoByCategoryTypeFashion,
    VideoByCategoryTypeTravel,
    VideoByCategoryTypeKids,
    VideoByCategoryTypeFunny,
    VideoByCategoryTypeMicrofilm,
    VideoByCategoryTypeNetdrama,
    VideoByCategoryTypePatcustomer,
    VideoByCategoryTypeOriginality,
    VideoByCategoryTypeSelfie,
    VideoByCategoryTypeAD,
};

+ (id)getAnimeWithPage:(NSInteger)page kCompletionHandle;

+ (id)getAnimeWithMainType:(NSString *)type Page:(NSInteger)page kCompletionHandle;

+ (id)getCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

+ (id)getVideosWithType:(NSString *)type Page:(NSInteger)page kCompletionHandle;

@end


/*
 全部
 电视剧
 电影
 综艺
 动漫
 音乐
 教育
 纪录片
 资讯
 娱乐
 体育
 汽车
 科技
 游戏
 生活
 时尚
 旅游
 亲子
 搞笑
 微电影
 网剧
 拍客
 创意视频
 自拍
 广告
 */