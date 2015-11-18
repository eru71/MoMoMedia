//
//  VideosByUserNetModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserNetModel.h"
#import "VideosByUserModel.h"

//每页内含量

#define kSetUserName(name,dic) [dic setObject:name forKey:@"user_name"];

#define VideosByUserURL @"https://openapi.youku.com/v2/videos/by_user.json"

@implementation VideosByUserNetModel

+(id)getVideosByUserWithUser:(NSString *)userName andPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id}];
    kSetUserName(userName, params)
    kSetPage(page, params)
    return [self GET:VideosByUserURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideosByUserModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
