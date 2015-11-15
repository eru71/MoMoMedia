//
//  CategoryModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class CategoryModel;
@class CategoryCategoriesModel;

@interface CategoryModel : BaseModel


@property (nonatomic, strong) NSArray<CategoryCategoriesModel *> *categories;

@end

@interface CategoryCategoriesModel : BaseModel

@property (nonatomic, copy) NSString *term;

@property (nonatomic, assign) NSInteger ID;//id

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *lang;

@property (nonatomic, strong) NSArray *genres;

@end

