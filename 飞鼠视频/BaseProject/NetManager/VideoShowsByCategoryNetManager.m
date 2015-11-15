//
//  VideoShowsByCategoryNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowsByCategoryNetManager.h"
#import "VideoCategoryModel.h"
#pragma mark - URLs
#define ShowsURL @"https://openapi.youku.com/v2/shows/by_category.json"

#pragma mark - params
#define kArea @"area": @"日本"
#define kCategoryAnime @"category": @"动漫"
#define kClient_id @"client_id": @"3f00be3594932727"
#define kOrderby @"orderby": @"lastupdate"
#define kCount @"count": @"2000"
#define kSetGenre(genre,dic) [dic setObject:[NSString stringWithFormat:@"%@",genre] forKey:@"genre"];
#define kSetPage(page,dic) [dic setObject:[NSString stringWithFormat:@"%ld",page] forKey:@"page"];

@implementation VideoShowsByCategoryNetManager


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

+(id)getAnimeWithPage:(NSInteger)page completionHandle:(void(^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kArea,kCategoryAnime,kClient_id,kOrderby,kCount}];
    kSetPage(page, params)
    return [self GET:ShowsURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoCategoryModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
