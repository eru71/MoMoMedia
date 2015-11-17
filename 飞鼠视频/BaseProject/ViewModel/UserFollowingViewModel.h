//
//  UserFollowingViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface UserFollowingViewModel : BaseViewModel

@property (nonatomic,assign) NSInteger rowNumber;

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,assign) NSInteger total;

- (id)initWithUserName:(NSString *)userName;

- (NSString *)nameForRow:(NSInteger)row;

- (NSInteger)videosCountForRow:(NSInteger)row;

@end
