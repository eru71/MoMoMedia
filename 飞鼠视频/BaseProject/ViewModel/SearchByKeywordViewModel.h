//
//  SearchByKeywordViewModel.h
//  BaseProject
//
//  Created by Colette71 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface SearchByKeywordViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;

@property (nonatomic,strong) NSString *keyword;

@property (nonatomic) NSInteger page;

-(id)initWithKeyword:(NSString *)keyword;

- (NSString *)titleForRow:(NSInteger)row;

- (NSURL *)linkForRow:(NSInteger)row;

- (NSURL *)thumbnailV2:(NSInteger)row;

- (NSString *)publishedForRow:(NSInteger)row;

- (NSString *)viewCountForRow:(NSInteger)row;

@end
