//
//  VideosByUserTableViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosByUserTableViewCell : UITableViewCell
//* 左侧图片 */
@property(nonatomic,strong)TRImageView *iconIV;
//* 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
//* 长题目标签 */
@property(nonatomic,strong)UILabel *longTitleLb;
//* 点击数标签 */
//* laben for clicks number */
@property(nonatomic,strong)UILabel *clicksNumLb;
@end
