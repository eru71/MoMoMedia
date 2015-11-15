//
//  VideoShowsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowsViewController.h"
#import "AnimeShowsWMPageController.h"
#import "AnimeShowsViewController.h"
@interface VideoShowsViewController ()

@end

@implementation VideoShowsViewController

+(VideoShowsViewController *)standardNavi{
    static VideoShowsViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [VideoShowsViewController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.translucent = NO;
    
//    AnimeShowsWMPageController *avc = [AnimeShowsWMPageController standardShows];
    
    AnimeShowsViewController *avc = [AnimeShowsViewController new];
    
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:avc];
    
    self.viewControllers = @[navc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
