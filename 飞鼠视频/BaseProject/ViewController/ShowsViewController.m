//
//  ShowsViewController.m
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowsViewController.h"
#import "DLPanableWebView.h"

#define IS_IPHONE_6_PLUS [UIScreen mainScreen].scale == 3
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface ShowsViewController ()<UIWebViewDelegate>

@property(nonatomic,strong) DLPanableWebView *webView;

@end
@implementation ShowsViewController{
    id navPanTarget_;
    SEL navPanAction_;
}


- (DLPanableWebView *)webView{
    if (!_webView) {
        _webView = [DLPanableWebView new];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    // 获取系统默认手势Handler并保存
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        NSMutableArray *gestureTargets = [self.navigationController.interactivePopGestureRecognizer valueForKey:@"_targets"];
        id gestureTarget = [gestureTargets firstObject];
        navPanTarget_ = [gestureTarget valueForKey:@"_target"];
        navPanAction_ = NSSelectorFromString(@"handleNavigationTransition:");
    }
    [self.webView loadRequest:_request];
}
- (id)initWithRequest:(NSURLRequest *)request webTitle:(NSString *)title{
    if (self=[super init]) {
        self.request = request;
        self.title = title;
        //推出来 不显示下方栏
//        self.hidesBottomBarWhenPushed = YES;
        
    }
    return self;
}

#pragma mark - DLPanableWebView
- (void)DLPanableWebView:(DLPanableWebView *)webView panPopGesture:(UIPanGestureRecognizer *)pan{
    if (navPanTarget_ && [navPanTarget_ respondsToSelector:navPanAction_]) {
        [navPanTarget_ performSelector:navPanAction_ withObject:pan];
    }
}

#pragma mark - WebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
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
