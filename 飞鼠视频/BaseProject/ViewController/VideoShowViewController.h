//
//  VideoShowViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoShowViewController : UIViewController

@property (nonatomic,copy) NSString *videoID;

- (id)initWithVideoID:(NSString *)videoID;

@end
