//
//  SearchByKeywordNetModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchByKeywordNetModel.h"
#import "SearchByKeywordModel.h"
#define kSetUserName(name,dic) [dic setObject:name forKey:@"user_name"];
#define kKeyword(keyword,dic) [dic setObject:keyword forKey:@"keyword"];
#define SearchByKeywordURL @"https://openapi.youku.com/v2/searches/video/by_keyword.json"

@implementation SearchByKeywordNetModel

+(id)getSearchByKeyword:(NSString *)keyword page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id}];
    kSetPage(page, params)
    kKeyword(keyword, params)
    return [self GET:SearchByKeywordURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SearchByKeywordModel mj_objectWithKeyValues:responseObj],error);
    }];
    
}

@end
