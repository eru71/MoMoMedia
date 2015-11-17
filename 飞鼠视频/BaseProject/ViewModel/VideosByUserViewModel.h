//
//  VideosByUserViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface VideosByUserViewModel : BaseViewModel

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,assign) NSInteger rowNumber;

- (id)initWithUserName:(NSString *)userName;

- (NSString *)titileForRow:(NSInteger)row;

- (NSURL *)linkForRow:(NSInteger)row;

- (NSURL *)thumbnailForRow:(NSInteger)row;

- (NSInteger)duration:(NSInteger)row;

- (NSString *)categoryForRow:(NSInteger)row;

- (NSInteger)viewCountForRow:(NSInteger)row;

- (NSInteger)commentCountForRow:(NSInteger)row;

- (NSString *)publishedForRow:(NSInteger)row;

@end



/*
 "title": "【游戏歪报】游戏战争的终极形态",
 "link": "http://v.youku.com/v_show/id_XMTM3NTMwMjgyNA==.html",
 "thumbnail": "http://r1.ykimg.com/0542040856360D7C6A0A4D047361B6D7",
 "duration": 282.4,
 "category": "游戏",
 "view_count": 11018,
 "comment_count": 123,
 "published": "2015-11-01 20:50:22",
 */