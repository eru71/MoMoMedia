//
//  VideoShowsViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface VideoShowsViewModel : BaseViewModel

@property (nonatomic,assign) NSInteger rowNumber;

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) NSString *type;

- (id)initWithType:(NSString *)type;

//节目名称
- (NSString *)nameForRow:(NSInteger)row;

//海报地址
- (NSURL *)iconForRow:(NSInteger)row;

//节目更新到
- (NSString *)episodeUpdatedForRow:(NSInteger)row;

//节目最后更新的时间
- (NSString *)lastupdateForRow:(NSInteger)row;

//节目网页地址
- (NSURL *)linkForRow:(NSInteger)row;

//节目最后一集的播放地址
- (NSURL *)lastPlayLinkForRow:(NSInteger)row;



@end
