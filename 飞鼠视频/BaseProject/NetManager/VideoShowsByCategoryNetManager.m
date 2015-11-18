//
//  VideoShowsByCategoryNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowsByCategoryNetManager.h"
#import "VideoCategoryModel.h"
#import "CategoryModel.h"

#pragma mark - URLs
#define ShowsURL @"https://openapi.youku.com/v2/shows/by_category.json"
#define CategoryURL @"https://openapi.youku.com/v2/schemas/video/category.json"

#pragma mark - params
#define kArea @"area": @"日本"
#define kCategoryAnime @"category": @"动漫"

#define kOrderby @"orderby": @"lastupdate" //lastupdate published
#define kCount @"count": @"2000"
#define kPeriod @"period": @"today"
#define kSetGenre(genre,dic) [dic setObject:[NSString stringWithFormat:@"%@",genre] forKey:@"genre"];
#define kSetPage(page,dic) [dic setObject:[NSString stringWithFormat:@"%ld",page] forKey:@"page"];
#define kSetCategory(type,dic) [dic setObject:type forKey:@"category"];
#define kSetArea(area,dic) [dic setObject:area forKey:@"area"];
#define kSetPeriod(dic) [dic setObject:@"today" forKey:@"period"];
@implementation VideoShowsByCategoryNetManager

+(id)getAnimeWithMainType:(NSString *)type Page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id,kOrderby,kCount}];
    kSetPage(page, params)
    if ([type isEqualToString:@"动漫"]) {
        kSetArea(@"日本", params)
    }
    kSetCategory(type, params)
    
    NSString *path = [self percentPathWithPath:ShowsURL params:params];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoCategoryModel mj_objectWithKeyValues:responseObj],error);
    }];
}

+(id)getAnimeWithPage:(NSInteger)page completionHandle:(void(^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kArea,kCategoryAnime,kClient_id,kOrderby,kCount}];
    kSetPage(page, params)
    return [self GET:ShowsURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoCategoryModel mj_objectWithKeyValues:responseObj],error);
    }];
}

+(id)getCategoryCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:CategoryURL parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([CategoryModel mj_objectWithKeyValues:responseObj],error);
    }];
}

/*
 +(id)getAnimeWithType:(VideoAnimeShowsType)type Page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
 NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kArea,kCategoryAnime,kClient_id,kOrderby,kCount}];
 kSetPage(page, params)
 
 switch (type) {
 default:
 break;
 case VideoAnimeShowsTypeAll: {
 break;
 }
 case VideoAnimeShowsTypeReasoning: {
 [params setObject:@"推理" forKey:@"genre"];
 break;
 }
 case VideoAnimeShowsTypeCollege: {
 [params setObject:@"校园" forKey:@"genre"];
 break;
 }
 case VideoAnimeShowsTypeFighting: {
 [params setObject:@"格斗" forKey:@"genre"];
 break;
 }
 case VideoAnimeShowsTypeEducation: {
 [params setObject:@"教育" forKey:@"genre"];
 break;
 }
 }
 
 return [self GET:ShowsURL parameters:params completionHandler:^(id responseObj, NSError *error) {
 completionHandle([VideoCategoryModel mj_objectWithKeyValues:responseObj],error);
 }];
 }
 */

@end
