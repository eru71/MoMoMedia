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
#import "VideosByCategoryModel.h"

#pragma mark - URLs
#define ShowsURL @"https://openapi.youku.com/v2/shows/by_category.json"
#define CategoryURL @"https://openapi.youku.com/v2/schemas/video/category.json"
#define VideoURL @"https://openapi.youku.com/v2/videos/by_category.json"

#pragma mark - params
#define kArea @"area": @"日本"
#define kCategoryAnime @"category": @"动漫"

#define KVideosOrderby @"orderby": @"published"
#define kCount @"count": @"24"
#define kPeriod @"period": @"today"
#define kSetGenre(genre,dic) [dic setObject:[NSString stringWithFormat:@"%@",genre] forKey:@"genre"];

#define kSetCategory(type,dic) [dic setObject:type forKey:@"category"];
#define kSetArea(area,dic) [dic setObject:area forKey:@"area"];
#define kSetPeriod(dic) [dic setObject:@"today" forKey:@"period"];
@implementation VideoShowsByCategoryNetManager

+(id)getAnimeWithMainType:(NSString *)type Page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id,kCount}];//,kCount,kVideoShowsOrderby
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

+ (id)getVideosWithType:(NSString *)type Page:(NSInteger)page kCompletionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id}];//,kCount
    kSetPage(page, params)
    kSetCategory(type, params)
    
    NSString *path = [self percentPathWithPath:VideoURL params:params];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideosByCategoryModel mj_objectWithKeyValues:responseObj],error);
    }];
}

+(id)getAnimeWithPage:(NSInteger)page completionHandle:(void(^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kArea,kCategoryAnime,kClient_id,kCount}];
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


@end
