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

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *request =[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[Oauth2 getRequestURLString]]];
    self.webView.delegate = self;
    
    [self.webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
//    [self showProgress];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:webView animated:YES];
//    hud.labelText = @"页面加载中...";
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSLog(@"加载完毕--%@",webView.request.URL);
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
        
        return NO;
    }
    
    return YES;
}





-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [self hideProgress];
    
    // 用户同意授权之后,返回的URL包含授权的request_code,形如: http://www.abc.com/?code=888888888888
    // 返回了用户授权的request_code的页面之后,需要截取code,然后继续拼接url,发起第3次请求(这次必须以POST方式),最终返回需要的access_token
    
    
//        else{
//            [self.webView loadRequest:self.webView.request];
//        }
    
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
//    [self hideProgress];
}

//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    
//    
//    
//    
//    
//        
//        //此返回的是回调的页面，return no 则不返回我们的回调页
//        
//    return YES;
//}

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

/*
 // 现在准备发起最后一次请求,拼接第3次请求的需要的URL,本次请求返回的东东,才会是最重要的用户的accessToken,也包含了用户
 NSString *accessTokenRequestURLStr = [Oauth2 getRequestTokenKeyWithCode:code];
 
 
 
 // 1,创建URL
 NSURL *accessTokenRequestURL = [NSURL URLWithString:accessTokenRequestURLStr];
 // 2,创建post请求
 NSMutableURLRequest *mutRequest = [[NSMutableURLRequest alloc]initWithURL:accessTokenRequestURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 //设置请求方式为POST，默认为GET
 [mutRequest setHTTPMethod:@"POST"];
 
 // 3,连接服务器,并接收返回的数据
 NSData *receivedData = [NSURLConnection sendSynchronousRequest:mutRequest returningResponse:nil error:nil];
 
 // 将服务器返回的数据转成字串(实质是JSON数据)
 NSString *responseStr = [[NSString alloc]initWithData:receivedData encoding:NSUTF8StringEncoding];
 NSLog(@"Response json is :%@",responseStr);
 
 // 4,从responseStr中(实质是JSON数据)获取到access_token
 // 将(JSON数据)转成字典先
 NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
 
 // 通过键,取到access_token
 NSString *access_token = [dictionary objectForKey:@"access_token"];
 NSLog(@"access token is:%@",access_token);
 NSString *Refresh_token = [dictionary objectForKey:@"refresh_token"];
 NSLog(@"refresh_token is:%@",Refresh_token);
 
 [dictionary writeToFile:user_token atomically:YES];
 
 // 授权成功,切换根控制器到主控制器
 UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"授权成功" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
 actionSheet.delegate = self;
 */

@end
