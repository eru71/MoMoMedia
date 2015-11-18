//
//  SearchByKeywordModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchByKeywordModel.h"

@implementation SearchByKeywordModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videos" : [SearchByKeywordVideosModel class]};
}
@end

@implementation SearchByKeywordVideosModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end


@implementation SearchByKeywordVideosUserModel

@end


