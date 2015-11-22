//
//  Oauth2.m
//  BaseProject
//
//  Created by eru71 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Oauth2.h"
#define kAppSecret @"ee873c02c96d02dc99bfdd3ad9bff1db"
#define kRedirectUri @"http://i.youku.com/u/home/"
#define kClientId @"3f00be3594932727"

@implementation Oauth2

+ (NSString*)getRequestURLString

{
    
    return [NSString stringWithFormat:@"https://openapi.youku.com/v2/oauth2/authorize?client_id=3f00be3594932727&response_type=code&redirect_uri=http://i.youku.com/u/home/"];
    
}


+(NSString *)getRequestTokenKeyWithCode:(NSString *)code{
    return [NSString stringWithFormat:@"https://openapi.youku.com/v2/oauth2/token?client_id=%@&client_secret=%@&grant_type=authorization_code&redirect_uri=%@&code=%@",kClientId,kAppSecret,kRedirectUri,code];
}

@end
