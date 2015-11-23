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
#import "MZGuidePages.h"
#import "VideoShowsViewController.h"
#import "VideoShowNetModel.h"
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
    
//        NSString *path = user_data;
        NSDictionary *userInfo = @{@"name":@"Colette71",@"userFollowing":@"克里斯解说;sinbasara"};
        [userInfo writeToFile:user_data atomically:YES];
//        NSLog(@"%@,%@",path,userInfo);
//        NSLog(@"%@",path);
    
    //    [SearchByKeywordNetModel getSearchByKeyword:@"黑色沙漠" page:1 completionHandle:^(id model, NSError *error) {
    //        NSLog(@"...");
    //    }];
    
//    [VideoShowNetModel getVideoShowWithID:@"XNDY5Njc0MTA4" completionHandle:^(id model, NSError *error) {
//        NSLog(@"....");
//    }];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    /*
      版本号:
      version:正式发布版本号，用户只能看到version
      build:测试版本号，是对于程序员来说的
      */
    //    NSLog(@"infoDic %@", infoDic);
    self.window.rootViewController = self.sideMenu;
    [self configGlobalUIStyle]; //配置全局UI样式
    [self.window makeKeyAndVisible];
    
    
    NSString *key =@"CFBundleShortVersionString";
    NSString *currentVersion=infoDic[key];
    //已运行过的版本号需要持久化处理，通常存储在userDefault中
    NSString *runVersion=[[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (runVersion==nil || ![runVersion isEqualToString:currentVersion] ) {
        //没运行过 或者 版本号不一致，则显示欢迎页
        //显示欢迎页,window根视图设置为欢迎控制器对象
        //保存新的版本号,防止下次运行再显示欢迎页
        [self guidePages];
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
    }
    
    return YES;
}

//用 shimme 完成 tabbar 闪光效果

- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[
                            @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg" ];
    
    //  初始化方法1
    MZGuidePages *mzgpc = [[MZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(MZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:2.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    
    //要在makeKeyAndVisible之后调用才有效
    [self.window addSubview:mzgpc];
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
        _sideMenu.backgroundImage = [UIImage imageWithColor:[UIColor purpleColor] cornerRadius:1];
        
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = NO;
        //        不允许菜单栏缩小到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
        //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }
    return _sideMenu;
}

@end
