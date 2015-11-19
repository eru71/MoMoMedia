//
//  VideoShowsViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowsViewModel.h"
#import "VideoShowsByCategoryNetManager.h"
#import "VideoCategoryModel.h"
@implementation VideoShowsViewModel

-(id)initWithType:(NSString *)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

//预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        //如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    _page += 1;
    self.dataTask = [VideoShowsByCategoryNetManager getAnimeWithMainType:_type Page:_page completionHandle:^(VideoCategoryModel* model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.shows];
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (VideoCategoryShowsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

//节目名称
- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

//海报地址
- (NSURL *)iconForRow:(NSInteger)row{
    return [self modelForRow:row].poster;
}

//节目更新到
- (NSString *)episodeUpdatedForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"更新至:%ld",[self modelForRow:row].episodeUpdated];
}

//节目最后更新的时间
- (NSString *)lastupdateForRow:(NSInteger)row{
    NSString *date =[self modelForRow:row].lastupdate;

    date = [self returnUploadTime:date];
    return date;
}



//节目网页地址
- (NSURL *)linkForRow:(NSInteger)row{
    return [self modelForRow:row].link;
}

//节目最后一集的播放地址
- (NSURL *)lastPlayLinkForRow:(NSInteger)row{
    return [self modelForRow:row].lastPlayLink;
}

-(NSString *)videoIDForRow:(NSInteger)row{
    NSString *string = [self modelForRow:row].playLink;
    NSRange range = [string rangeOfString:@"_X"];//匹配得到的下标
    NSLog(@"rang:%@",NSStringFromRange(range));
    NSString* string1 = [string substringFromIndex:range.location+1];//截取范围类的字符串
    NSLog(@"截取的值为：%@",string1);
    range = [string1 rangeOfString:@"."];
    string1 = [string1 substringToIndex:range.location];
    NSLog(@"%@",string1);
    return string1;
}

@end
