//
//  UserInfoTool.h
//  BaseProject
//
//  Created by tarena on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoTool : NSObject

+ (void)saveUserToken:(NSDictionary *)userTokenDictionary;

+ (void)saveUserInfo:(NSDictionary *)userInfoDictionary;

@end
