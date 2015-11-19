//
//  VideoCategoryModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCategoryModel.h"

@implementation VideoCategoryModel


+ (NSDictionary *)objectClassInArray{
    return @{@"shows" : [VideoCategoryShowsModel class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"qid": @"id"};
}

@end


@implementation VideoCategoryShowsModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end


