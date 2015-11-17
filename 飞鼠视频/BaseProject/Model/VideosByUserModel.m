//
//  VideosByUserModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideosByUserModel.h"

@implementation VideosByUserModel


+ (NSDictionary *)objectClassInArray{
    return @{@"videos" : [VideosByUserVideosModel class]};
}


@end

@implementation VideosByUserVideosModel

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    
    if ([propertyName isEqualToString:@"bigThumbnail"]) {
        return propertyName;
    }
    
    return [propertyName mj_underlineFromCamel];
}

@end


/*
 https://openapi.youku.com/v2/videos/by_user.json
 
 client_id	string	true		应用Key
 user_id	int	false		用户ID
 user_name	string	false		用户名
 orderby	string	false	published	排序
 published: 发布时间
 view-count: 总播放数
 comment-count: 总评论数
 favorite-count: 总收藏数	published
 page	int	false	1	页数	1
 count	int	false	20	页大小	20
 last_item	json string	false		上次翻页的最后一条记录的信息，包括页数、排序字段值和视频id，直接使用接口返回的last_item值即可	{
 “total”:1372,
 ”id”:4125723,
 ”sort_value”:1200622190,
 ”page”:41
 }
 
 返回参数
 
 参数	类型	允许为空	说明	示例
 id	string	false	视频唯一ID
 title	string	false	视频标题
 link	string	false	视频播放链接
 thumbnail	string	false	视频截图
 duration	int	false	视频时长，单位：秒
 category	string	false	视频分类
 state	string	false	视频状态
 normal: 正常
 limited: 分级
 uploaded: 上传完成
 encoding: 转码中
 fail: 转码失败
 checking: 审核中
 blocked: 已屏蔽
 view_count	int	false	总播放数
 favorite_count	int	false	总收藏数
 comment_count	int	false	总评论数
 up_count	int	false	总顶数
 down_count	int	false	总踩数
 published	string	false	发布时间
 */





