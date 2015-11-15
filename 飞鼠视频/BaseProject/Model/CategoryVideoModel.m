//
//  CategoryVideoModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryVideoModel.h"

@implementation CategoryVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videos" : [CategoryVideoVideosModel class]};
}
@end
@implementation CategoryVideoVideosModel

@end


@implementation CategoryVideoVideosUserModel

@end


