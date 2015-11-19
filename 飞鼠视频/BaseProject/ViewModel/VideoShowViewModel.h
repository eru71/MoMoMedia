//
//  VideoShowViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoShowModel.h"

@interface VideoShowViewModel : BaseViewModel

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,strong) VideoShowModel *vsM;

- (id)initWithVideoID:(NSString *)ID;

- (NSURL *)playerLink;

- (NSString *)title;

@end
