//
//  VideosByUserViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserViewModel.h"
#import "VideosByUserModel.h"
#import "VideosByUserNetModel.h"

@implementation VideosByUserViewModel

//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

-(id)initWithUserName:(NSString *)userName{
    if (self = [super init]) {
        _userName = userName;
    }
    return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    
    _page += 1;
    
    self.dataTask = [VideosByUserNetModel getVideosByUserWithUser:_userName andPage:_page completionHandle:^(VideosByUserModel* model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videos];
        completionHandle(error);
    }];
}

- (VideosByUserVideosModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)titileForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)linkForRow:(NSInteger)row{
    return [self modelForRow:row].link;
}

- (NSURL *)thumbnailForRow:(NSInteger)row{
    return [self modelForRow:row].bigThumbnail;
}

- (NSInteger)duration:(NSInteger)row{
    return [self modelForRow:row].duration;
}

- (NSString *)categoryForRow:(NSInteger)row{
    return [self modelForRow:row].category;
}

- (NSInteger)viewCountForRow:(NSInteger)row{
    return [self modelForRow:row].viewCount;
}

- (NSInteger)commentCountForRow:(NSInteger)row{
    return [self modelForRow:row].commentCount;
}

- (NSString *)publishedForRow:(NSInteger)row{
    return [self modelForRow:row].published;
}

@end
