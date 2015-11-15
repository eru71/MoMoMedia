//
//  ShowsViewController.h
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowsViewController : UIViewController

@property(nonatomic,strong) NSURLRequest *request;
@property (nonatomic,strong) NSString *webTitle;

- (id)initWithRequest:(NSURLRequest *)request webTitle:(NSString *)title;

@end
