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
@property (nonatomic,strong) UIActivityIndicatorView *activityIndicator;

@end
@implementation ShowsViewController

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
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
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(kWindowW/2-20, kWindowH/2-20, 50, 50);
    [activityIndicator setCenter:self.view.center];
    [self.view addSubview:activityIndicator];
    self.activityIndicator = activityIndicator;
    [self.webView loadRequest:self.request];
    

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
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
    [self.activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
    [self.activityIndicator stopAnimating];

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
