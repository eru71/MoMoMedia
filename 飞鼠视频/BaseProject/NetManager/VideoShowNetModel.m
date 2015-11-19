//
//  VideoShowNetModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowNetModel.h"
#import "VideoShowModel.h"
#define VideoShowURL @"https://openapi.youku.com/v2/videos/show.json"
#define kSetID(ID,dic) [dic setObject:ID forKey:@"video_id"];

@implementation VideoShowNetModel

+(id)getVideoShowWithID:(NSString *)ID completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{kClient_id}];
    kSetID(ID, params)
    return [self GET:VideoShowURL parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoShowModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
