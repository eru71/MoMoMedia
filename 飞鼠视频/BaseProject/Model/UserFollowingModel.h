//
//  UserFollowingModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class UserFollowingUsersModel;
@interface UserFollowingModel : BaseModel

@property (nonatomic, strong) NSArray<UserFollowingUsersModel *> *users;

@property (nonatomic, copy) NSString *total;

@end

#pragma mark - UserFollowingUsersModel
@interface UserFollowingUsersModel : BaseModel

@property (nonatomic, copy) NSString *ID;//id

@property (nonatomic, copy) NSString *desc;//description

@property (nonatomic, copy) NSString *avatarLarge;

@property (nonatomic, assign) NSInteger followersCount;

@property (nonatomic, assign) NSInteger subscribeCount;

@property (nonatomic, assign) BOOL follower;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger videosCount;

@property (nonatomic, assign) NSInteger followingCount;

@property (nonatomic, assign) NSInteger statusesCount;

@property (nonatomic, copy) NSString *registTime;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger vvCount;

@property (nonatomic, assign) NSInteger favoritesCount;

@property (nonatomic, assign) NSInteger playlistsCount;

@property (nonatomic, assign) BOOL following;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *gender;

@end

/*
 
 https://openapi.youku.com/v2/users/friendship/followings.json
 client_id 3f00be3594932727
 user_name Colette71
 
 {
 "users": [
 {
 "id": "426800851",
 "name": "克里斯解说",
 "gender": "m",
 "description": "没有那么多理由，就是喜欢游戏。",
 "link": "http://i.youku.com/u/UMTcwNzIwMzQwNA==",
 "avatar": "http://g2.ykimg.com/0130391F455406840D9D4D197076D3825CFFE0-6E15-A41C-ADB8-08304417219F",
 "avatar_large": "http://g2.ykimg.com/0130391F455406840DE3BE197076D3D5E7F429-0001-B557-4088-1397D6921483",
 "videos_count": 0,
 "playlists_count": 8,
 "favorites_count": 0,
 "followers_count": 215,
 "following_count": 0,
 "statuses_count": 4,
 "subscribe_count": 0,
 "vv_count": 0,
 "following": false,
 "follower": false,
 "regist_time": "2014-09-03 10:39:28"
 },
 {
 "id": "87302107",
 "name": "sinbasara",
 "gender": "m",
 "description": "古来圣贤皆寂寞，唯手淫者留其名。\n新浪围脖：http://weibo.com/u/2467004277\n疼迅围脖：http://t.qq.com/sinbasara  \n群：166140501 \n~~谢谢各位支持~~",
 "link": "http://i.youku.com/u/UMzQ5MjA4NDI4",
 "avatar": "http://g3.ykimg.com/0130391F484DC5EF76563505341FDB372A6E15-4295-CE39-674C-5690E6BCC63E",
 "avatar_large": "http://g4.ykimg.com/0130391F484DC5EF77EAFF05341FDB51838343-D167-9AAD-C6E1-1DC2FB664671",
 "videos_count": "81",
 "playlists_count": 3,
 "favorites_count": 4,
 "followers_count": 155038,
 "following_count": 5255,
 "statuses_count": 97,
 "subscribe_count": 0,
 "vv_count": 16654334,
 "following": false,
 "follower": false,
 "regist_time": "2011-05-08 08:56:48"
 }
 ],
 "total": null
 }
 */

