//
//  VideoShowNetModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface VideoShowNetModel : BaseNetManager

+ (id)getVideoShowWithID:(NSString *)ID completionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
