//
//  ShowsViewController.m
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowsViewController.h"

@interface ShowsViewController ()<UIWebViewDelegate>

@property(nonatomic,strong) UIWebView *webView;
//@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;

@end
@implementation ShowsViewController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:self.request];
        _webView.delegate = self;

    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];

    self.webView.scalesPageToFit = YES;

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


#pragma mark - WebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    [self.activityIndicator startAnimating];
//    NSLog(@"shouldStartLoad");
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
//    NSLog(@"didstart");
    [self showProgress];
//    [self.activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    NSLog(@"didfinish");
    [self hideProgress];
//    [self.activityIndicator stopAnimating];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
//    [self hideProgress];
//    [self showErrorMsg:@"网络出错"];
    // Black base color for background matches the native apps

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
