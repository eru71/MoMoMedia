//
//  VategoryViewModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface VategoryViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

- (NSString *)nameForRow:(NSInteger)row;

- (NSInteger)IDForRow:(NSInteger)row;

@end
