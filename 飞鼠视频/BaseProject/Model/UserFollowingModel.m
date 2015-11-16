//
//  UserFollowingModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "UserFollowingModel.h"

@implementation UserFollowingModel

+ (NSDictionary *)objectClassInArray{
    return @{@"users" : [UserFollowingUsersModel class]};
}

@end

@implementation UserFollowingUsersModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end