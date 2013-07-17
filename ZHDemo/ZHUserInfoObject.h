//
//  ZHUserInfoObject.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHObject.h>

@interface ZHUserInfoObject : ZHObject

@property (nonatomic) NSString *name;//姓名
@property (nonatomic) NSString *headline;//用户名旁边的介绍
@property (nonatomic) NSString *des;//头像下边的简介
@property (nonatomic) NSString *avatar_url;//头像地址
@property (nonatomic) NSNumber *gender;//性别，1代表男性  -1代表女性
@property (nonatomic) NSString *following_topic_count;//他的话题
@property (nonatomic) NSString *following_count;//他关注的人
@property (nonatomic) NSString *follower_count;//关注他的人
@property (nonatomic) NSString *voteup_count;//赞过他的人
@property (nonatomic) NSString *thanked_count;//喜欢他的人
@property (nonatomic) NSString *answer_count;//答过
@property (nonatomic) NSString *question_count;//问过
@property (nonatomic) NSString *favorite_count;//他的收藏
@property (nonatomic) NSString *sina_weibo_name;//新浪微博用户名
@property (nonatomic) NSString *qq_weibo_name;//腾讯微博用户名
@property (nonatomic) NSString *favorited_count;//答案被收藏
@property (nonatomic) NSString *shared_count;//答案被分享
@property (nonatomic) NSDictionary *business;//从事行业
@property (nonatomic) NSArray *education;//教育经历
@property (nonatomic) NSArray *employment;//工作经历
@property (nonatomic) NSArray *location;//居住地

@end
