//
//  VategoryViewModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VategoryViewModel.h"
#import "CategoryModel.h"
#import "VideoShowsByCategoryNetManager.h"
@implementation VategoryViewModel

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [VideoShowsByCategoryNetManager getCategoryCompletionHandle:^(CategoryModel* model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.categories];
        completionHandle(error);
    }];
}

- (CategoryCategoriesModel *)modelForModel:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForModel:row].label;
}

- (NSInteger)IDForRow:(NSInteger)row{
    return [self modelForModel:row].ID;
}


@end
