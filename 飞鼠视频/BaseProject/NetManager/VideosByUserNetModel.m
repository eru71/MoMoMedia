//
//  VideosByUserNetModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserNetModel.h"
#import "VideosByUserModel.h"

#define kCount @"count": @"100"
#define kSetUserName(name,dic) [dic setObject:name forKey:@"user_name"];
#define kSetPage(page,dic) [dic setObject:[NSString stringWithFormat:@"%ld",page] forKey:@"page"];
#define VideosByUserURL @"https://openapi.youku.com/v2/videos/by_user.json"

@implementation VideosByUserNetModel

+(id)getVideosByUserWithUser:(NSString *)userName andPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id,kCount}];
    kSetUserName(userName, params)
    kSetPage(page, params)
    return [self GET:VideosByUserURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideosByUserModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
