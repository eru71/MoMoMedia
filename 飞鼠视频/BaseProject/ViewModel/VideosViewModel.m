//
//  VideosViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosViewModel.h"
#import "VideoShowsByCategoryNetManager.h"
#import "VideosByCategoryModel.h"

@implementation VideosViewModel


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
    self.dataTask = [VideoShowsByCategoryNetManager getVideosWithType:_type Page:_page completionHandle:^(VideosByCategoryModel* model, NSError *error) {
        if (error) {
            NSLog(@"这儿是分类错误显示-----:%@",error);
        }
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videos];
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

- (VideosByCategoryVideosModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

//节目名称
- (NSString *)nameForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

//海报地址
- (NSURL *)iconForRow:(NSInteger)row{
    return [self modelForRow:row].bigThumbnail;
}

//节目更新到
//- (NSString *)episodeUpdatedForRow:(NSInteger)row{
//    return [NSString stringWithFormat:@"更新至:%ld",[self modelForRow:row].episodeUpdated];
//}

//节目最后更新的时间
- (NSString *)lastupdateForRow:(NSInteger)row{
    NSString *date =[self modelForRow:row].published;
    
    date = [self returnUploadTime:date];
    return date;
}



//节目网页地址
- (NSURL *)linkForRow:(NSInteger)row{
    return [self modelForRow:row].link;
}


-(NSString *)videoIDForRow:(NSInteger)row{
    NSString *string = [self modelForRow:row].user.link;
    string = [self returnVideoID:string];
    return string;
}

-(NSString *)viewCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].viewCount];
}


@end
