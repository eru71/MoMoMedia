//
//  SearchByKeywordViewModel.m
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchByKeywordViewModel.h"
#import "SearchByKeywordNetModel.h"
#import "SearchByKeywordModel.h"

@implementation SearchByKeywordViewModel

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
    self.dataTask = [SearchByKeywordNetModel getSearchByKeyword:_keyword page:_page completionHandle:^(SearchByKeywordModel* model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.videos];
        completionHandle(error);
    }];
}

- (SearchByKeywordVideosModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(id)initWithKeyword:(NSString *)keyword{
    if (self = [super init]) {
        _keyword = keyword;
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

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)linkForRow:(NSInteger)row{
    return [self modelForRow:row].link;
}

- (NSURL *)thumbnailV2:(NSInteger)row{
    return [self modelForRow:row].thumbnailV2;
}

- (NSString *)publishedForRow:(NSInteger)row{
    NSString *time = [self returnUploadTime:[self modelForRow:row].published];
    return time;
}

- (NSString *)viewCountForRow:(NSInteger)row{
    return  [NSString stringWithFormat:@"%ld",(long)[self modelForRow:row].viewCount];
}

@end
