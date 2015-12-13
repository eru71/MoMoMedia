//
//  LoginViewController.m
//  BaseProject
//
//  Created by eru71 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "Oauth2.h"
@interface LoginViewController ()<UIWebViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
#import "BaseNetManager.h"

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *request =[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[Oauth2 getRequestURLString]]];
    self.webView.delegate = self;
    [Factory addMenuItemToVC:self];
    [self.webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
//    NSLog(@"加载完毕--%@",webView.request.URL);
    // 一旦加载完毕,就隐藏进度条
    //    [MBProgressHUD hideAllHUDsForView:webView animated:YES];
    
    NSString *reDirectURLContainsCode = self.webView.request.URL.absoluteString;
    NSLog(@"加载完毕-reDirectURLContainsCode-%@",reDirectURLContainsCode);
    // 分类方法,从左边标记字串的最后面开始,截取剩下的字符串
    NSRange range = [reDirectURLContainsCode rangeOfString:@"code="];

    NSString *code = nil;
    if (range.length > 0 ) {
        code = [reDirectURLContainsCode substringFromIndex:range.location + 5];
        range = [code rangeOfString:@"&"];
        code = [code substringToIndex:range.location];
        NSLog(@"code=%@",code);
        
        [Oauth2 accessTokenWithCode:code];
        [self dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }

    
    return YES;
}





-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];

}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [actionSheet showInView:self.view.window];
            break;
        case 1:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
