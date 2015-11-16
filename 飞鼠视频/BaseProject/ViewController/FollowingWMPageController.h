//
//  FollowingWMPageController.h
//  BaseProject
//
//  Created by Colette71 on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <WMPageController/WMPageController.h>

@interface FollowingWMPageController : WMPageController

//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardFollowNavi;

@end
