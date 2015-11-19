//
//  VideoShowModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowModel.h"

@implementation VideoShowModel


+(NSDictionary *)mj_objectClassInArray{
    return @{@"user":[VideoShowUserModel class],@"source":[VideoShowSourceModel class]};
}

@end

@implementation VideoShowUserModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end


@implementation VideoShowSourceModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end



