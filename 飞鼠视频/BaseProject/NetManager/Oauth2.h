//
//  Oauth2.h
//  BaseProject
//
//  Created by eru71 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetManager.h"
@interface Oauth2 : BaseNetManager

+ (NSString*)getRequestURLString;

+ (NSString *)getRequestTokenKeyWithCode:(NSString *)code;

+ (void)accessTokenWithCode:(NSString*)code;

@end
