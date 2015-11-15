//
//  GenreModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class GenreDataModel;
@interface GenreModel : BaseModel

@property (nonatomic, strong) NSArray<GenreDataModel *> *data;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) CGFloat cost;

@end
@interface GenreDataModel : BaseModel

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSString *name;

@end

