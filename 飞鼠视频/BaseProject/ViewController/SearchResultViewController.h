//
//  SearchResultViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController
@property(nonatomic,copy) NSString *keyword;
- (id)initWithKeyword:(NSString *)keyword;
@end
