//
//  UserFollowingNetManager.m
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "UserFollowingNetManager.h"
#import "UserFollowingModel.h"
#define FollowURL @"https://openapi.youku.com/v2/users/friendship/followings.json"
#define kSetUserName(name,dic) [dic setObject:name forKey:@"user_name"];


@implementation UserFollowingNetManager

+(id)getUserFollowingWithUserName:(NSString *)name Page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id}];
    kSetUserName(name, params)
    kSetPage(page, params)
    return [self GET:FollowURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([UserFollowingModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
