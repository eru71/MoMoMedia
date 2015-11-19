//
//  GenreModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GenreModel.h"

@implementation GenreModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [GenreDataModel class]};
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

@end

@implementation GenreDataModel

@end


