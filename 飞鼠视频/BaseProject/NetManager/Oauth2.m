//
//  Oauth2.m
//  BaseProject
//
//  Created by eru71 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Oauth2.h"
#define kAppSecret @"ee873c02c96d02dc99bfdd3ad9bff1db"
#define kRedirectUri @"http://www.youku.com/"
#define kClientId @"3f00be3594932727"

@implementation Oauth2

+ (NSString*)getRequestURLString
{
    return [NSString stringWithFormat:@"https://openapi.youku.com/v2/oauth2/authorize?client_id=3f00be3594932727&response_type=code&redirect_uri=%@&state=xyz",kRedirectUri];
}


+(NSString *)getRequestTokenKeyWithCode:(NSString *)code{
    return [NSString stringWithFormat:@"https://openapi.youku.com/v2/oauth2/token?client_id=3f00be3594932727&client_secret=%@&grant_type=authorization_code&redirect_uri=%@&code=%@",kAppSecret,kRedirectUri,code];
}

+ (void)accessTokenWithCode:(NSString*)code {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = kClientId;
    params[@"client_secret"] = kAppSecret;
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = kRedirectUri;
    params[@"code"] = code;
    
    [manager POST:@"https://openapi.youku.com/v2/oauth2/token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        //将获取的accessToken，过期时间，用户id存储到沙盒中
        
        NSLog(@"%@",responseObject.allKeys);
        NSLog(@"%@",responseObject.allValues);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

@end
