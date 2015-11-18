//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "VideoShowsViewController.h"
//#import "VideoShowsByCategoryNetManager.h"
//#import "VategoryViewModel.h"
//#import "VideoShowsViewModel.h"
//#import "VideosByUserNetModel.h"
//#import "SearchByKeywordNetModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    /** 测试用代码 */
//    [VideoShowsByCategoryNetManager getAnimeWithPage:1 completionHandle:^(id model, NSError *error) {
//        NSLog(@"....");
//    }];

//    [VideoShowsByCategoryNetManager getAnimeWithPage:1 completionHandle:^(id model, NSError *error) {
//        NSLog(@"...");
//    }];
    
//    [VideoShowsByCategoryNetManager getCategoryCompletionHandle:^(id model, NSError *error) {
//        NSLog(@"....");
//    }];
    
//    [VideosByUserNetModel getVideosByUserWithUser:@"克里斯解说" andPage:1 completionHandle:^(id model, NSError *error) {
//        NSLog(@"..");
//    }];
    
//    NSString *path = user_data;
//    NSDictionary *userInfo = @{@"name":@"Colette71",@"userFollowing":@"克里斯解说;sinbasara"};
//    [userInfo writeToFile:user_data atomically:YES];
//    NSLog(@"%@,%@",path,userInfo);
//    NSLog(@"%@",path);
    
//    [SearchByKeywordNetModel getSearchByKeyword:@"黑色沙漠" page:1 completionHandle:^(id model, NSError *error) {
//        NSLog(@"...");
//    }];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle]; //配置全局UI样式
    return YES;
}
/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor] cornerRadius:1]forBarMetrics:UIBarMetricsDefault];
    
    
    
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTitleFontSize], NSForegroundColorAttributeName: kNaviTitleColor}];
}


/** 代码重构:用代码把功能实现以后，考虑代码结构如何编写可以更加方便后期维护 */
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[VideoShowsViewController standardNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];

//        _sideMenu.backgroundImage =[UIImage imageNamed:@""];
        _sideMenu.backgroundImage = [UIImage imageWithColor:[UIColor blackColor] cornerRadius:1];
        
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = NO;
        //        不允许菜单栏缩小到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }
    return _sideMenu;
}

@end
