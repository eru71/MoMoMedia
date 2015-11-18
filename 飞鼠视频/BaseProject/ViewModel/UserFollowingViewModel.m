//
//  UserFollowingViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "UserFollowingViewModel.h"
#import "UserFollowingNetManager.h"
#import "UserFollowingModel.h"

@implementation UserFollowingViewModel

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
//    if (_page == _total) {
//        return;
//    }
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    _page += 1;
    self.dataTask = [UserFollowingNetManager getUserFollowingWithUserName:_userName Page:_page completionHandle:^(UserFollowingModel* model, NSError *error) {
//        _total = model.total;
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.users];
        completionHandle(error);
    }];
}

- (UserFollowingUsersModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (NSInteger)videosCountForRow:(NSInteger)row{
    return [self modelForRow:row].videosCount;
}

@end
