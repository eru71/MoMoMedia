//
//  SearchByKeywordNetModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface SearchByKeywordNetModel : BaseNetManager

+ (id)getSearchByKeyword:(NSString *)keyword page:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
