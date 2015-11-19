//
//  VideoShowViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoShowViewController.h"
#import "VideoShowViewModel.h"
#import "ShowsViewController.h"
#import <AVKit/AVKit.h>
@interface VideoShowViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) VideoShowViewModel *videoVM;

@property(nonatomic,strong) UIWebView *webView;

@end
@implementation VideoShowViewController

-(id)initWithVideoID:(NSString *)videoID{
    if (self = [super init]) {
        self.videoID = videoID;
        [self showProgress];
        
    }
    return self;
}

- (VideoShowViewModel *)videoVM {
    if(_videoVM == nil) {
        _videoVM = [[VideoShowViewModel alloc] initWithVideoID:self.videoID];
        
    }
    return _videoVM;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    //请求时要有正在操作的提示
    [self showProgress];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.videoVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self showProgress];
       // self.url = [NSURL URLWithString:self.videoVM.vsM.player];
        if (error) {
            [self showErrorMsg:error.localizedDescription];
        }else
        {
            NSURL* url = [NSURL URLWithString:self.videoVM.vsM.player];
            NSURLRequest *request=[NSURLRequest requestWithURL:url];
            [_webView loadRequest:request];
        }
        
    }];

}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //YES代表加载网页  NO 代表不加载
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
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
