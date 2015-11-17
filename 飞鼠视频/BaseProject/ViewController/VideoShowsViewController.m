//
//  VideoShowsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowsViewController.h"

#import "AnimeShowsViewController.h"
#import "CategoryViewController.h"
#import "CategoryTableViewController.h"
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

    AnimeShowsViewController *avc = [[AnimeShowsViewController alloc]initWithType:@"动漫"];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:avc];
    navc.title = @"动漫";
    
    AnimeShowsViewController *mvc = [[AnimeShowsViewController alloc]initWithType:@"电影"];
    UINavigationController *nmvc = [[UINavigationController alloc]initWithRootViewController:mvc];
    nmvc.title = @"电影";
    
    AnimeShowsViewController *tvc = [[AnimeShowsViewController alloc]initWithType:@"电视剧"];
    UINavigationController *ntvc = [[UINavigationController alloc]initWithRootViewController:tvc];
    ntvc.title = @"电视剧";
    
    AnimeShowsViewController *vvc = [[AnimeShowsViewController alloc]initWithType:@"综艺"];
    UINavigationController *nvvc = [[UINavigationController alloc]initWithRootViewController:vvc];
    nvvc.title = @"综艺";
    
//    CategoryViewController *cvc = [[CategoryViewController alloc]init];
    CategoryTableViewController *cvc = [CategoryTableViewController new];
    UINavigationController *ncvc = [[UINavigationController alloc]initWithRootViewController:cvc];
    cvc.title = @"其他";
    ncvc.title = @"其他";
    
    self.viewControllers = @[navc,nmvc,ntvc,nvvc,ncvc];
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
