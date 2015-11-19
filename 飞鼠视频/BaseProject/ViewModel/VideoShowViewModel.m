//
//  VideoShowViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowViewModel.h"
#import "VideoShowNetModel.h"
#import "ShowsViewController.h"

@interface VideoShowViewModel()



@end

@implementation VideoShowViewModel


-(id)initWithVideoID:(NSString *)ID{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

/** 防御性编程，不允许使用init初始化 */
- (id)init{
    if (self = [super init]) {
        //%s->__func__  会显示 哪个类中的哪个方法
        NSAssert1(NO, @"%s 必须使用initWithAid初始化", __func__);
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [VideoShowNetModel getVideoShowWithID:_ID completionHandle:^(VideoShowModel* model, NSError *error) {
        self.vsM = model;
        completionHandle(error);
    }];
}

-(NSString *)title{
    return self.vsM.title;
}

@end
