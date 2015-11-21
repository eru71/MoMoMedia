//
//  BaseViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

- (NSString *)returnUploadTime:(NSString *)lastupdate
{
    // xxxx-xx-xx xx:xx:xx
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"YY-MM-dd HH:mm:SS"];
    NSDate *d=[date dateFromString:lastupdate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
                timeString = [NSString stringWithFormat:@"%f", cha/3600];
                timeString = [timeString substringToIndex:timeString.length-7];
                timeString=[NSString stringWithFormat:@"%@小时前", timeString];
//        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"HH:mm"];
//        timeString = [NSString stringWithFormat:@"今天 %@",[dateformatter stringFromDate:d]];
        
    }
    if (cha/86400>1)
    {
                timeString = [NSString stringWithFormat:@"%f", cha/86400];
                timeString = [timeString substringToIndex:timeString.length-7];
                timeString=[NSString stringWithFormat:@"%@天前", timeString];
//        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
//        [dateformatter setDateFormat:@"YY-MM-dd HH:mm"];
//        timeString = [NSString stringWithFormat:@"%@",[dateformatter stringFromDate:d]];
        
    }
    
    return timeString;
}

-(NSString *)returnVideoID:(NSString *)videoID{

    NSRange range = [videoID rangeOfString:@"_X"];//匹配得到的下标
    NSLog(@"rang:%@",NSStringFromRange(range));
    NSString* string1 = [videoID substringFromIndex:range.location+1];//截取范围类的字符串
    NSLog(@"截取的值为：%@",string1);
    range = [string1 rangeOfString:@"."];
    string1 = [string1 substringToIndex:range.location];
    NSLog(@"%@",string1);
    return string1;
}

@end
