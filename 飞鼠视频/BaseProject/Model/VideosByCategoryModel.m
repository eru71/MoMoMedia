//
//  VideosByCategoryModel.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByCategoryModel.h"

@implementation VideosByCategoryModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videos" : [VideosByCategoryVideosModel class]};
}

@end


@implementation VideosByCategoryVideosModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    
    if ([propertyName isEqualToString:@"bigThumbnail"]) {
        return propertyName;
    }
    
    return [propertyName mj_underlineFromCamel];
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"user":[VideoByCategoryUserModel class]};
}

@end


@implementation VideoByCategoryUserModel



@end


