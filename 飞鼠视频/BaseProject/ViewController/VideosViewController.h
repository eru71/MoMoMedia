//
//  VideosViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosViewController : UIViewController

@property (nonatomic,strong) NSString *type;

- (id)initWithType:(NSString *)type;

@end
