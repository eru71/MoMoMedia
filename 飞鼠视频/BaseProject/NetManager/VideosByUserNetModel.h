//
//  VideosByUserNetModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface VideosByUserNetModel : BaseNetManager

+ (id)getVideosByUserWithUser:(NSString *)userName andPage:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle;



@end
