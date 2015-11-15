//
//  CategoryModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+ (NSDictionary *)objectClassInArray{
    return @{@"categories" : [CategoryCategoriesModel class]};
}
@end

@implementation CategoryCategoriesModel

@end


