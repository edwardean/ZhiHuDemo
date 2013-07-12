//
//  ZHUserInfoParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHObject.h"

@interface ZHUserInfoParser ()

@property (nonatomic) ZHObject *baseObject;

@end

@implementation ZHUserInfoParser

@synthesize baseObject = baseObject_;

- (id)parser
{
  self.baseObject = [[ZHObject alloc] init];
  
	NSData *data = [ZHLoadJSONFile UserInfoData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  NSString *following_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"following_count"] integerValue]];//他关注的人
  NSString *following_topic_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"following_topic_count"] integerValue]];//他的话题
  NSString *follower_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"follower_count"] integerValue]];//关注他的人
  NSString *name = [dictionary objectForKey:@"name"];//用户名
  NSString *headline = [dictionary objectForKey:@"headline"];//用户名旁边的介绍
  NSString *description = [dictionary objectForKey:@"description"];//头像下边的简介
  NSNumber *gender = [dictionary objectForKey:@"gender"];//性别，1代表男性  -1代表女性
  NSString *avatar_url = [dictionary objectForKey:@"avatar_url"];//头像地址
  NSString *favorite_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"favorite_count"] integerValue]];//他的收藏
  NSString *voteup_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"voteup_count"] integerValue]];//赞过他的人
  NSString *thanked_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"thanked_count"] integerValue]];//喜欢他的人
  NSString *answer_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"answer_count"] integerValue]];//答过
  NSString *question_count = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"question_count"] integerValue]];//问过
  
  NSString *sina_weibo_name = [dictionary objectForKey:@"sina_weibo_name"];//新浪微博用户名
  NSString *qq_weibo_name = [dictionary objectForKey:@"qq_weibo_name"];//腾讯微博用户名
  
  //详情页面的其它数据
  NSString *favorited_count = [dictionary objectForKey:@"favorited_count"];//答案被收藏
  NSString *shared_count = [dictionary objectForKey:@"shared_count"];//答案被分享
  //他获得的赞同就是voteup_count（赞过他的人）
  //他获得的感谢就是thanked_count（喜欢他的人）
  
  NSDictionary *business = [dictionary objectForKey:@"business"];//从事行业
  
  NSArray *education = [dictionary objectForKey:@"education"];//教育经历
  
  NSArray *employment = [dictionary objectForKey:@"employment"];//工作经历
  
	NSArray *location = [dictionary objectForKey:@"location"];//居住地

  NSDictionary *userInfoDictionary = @{@"name" : name,
                                       @"headline" : headline,
                                       @"description" : description,
                                       @"avatar_url" : avatar_url,
                                       @"gender" : gender,
                                       @"following_topic_count" : following_topic_count,
                                       @"following_count" : following_count,
                                       @"follower_count" : follower_count,
                                       @"voteup_count" : voteup_count,
                                       @"thanked_count" : thanked_count,
                                       @"answer_count" : answer_count,
                                       @"question_count" : question_count,
                                       @"favorite_count" : favorite_count,
                                       @"sina_weibo_name" : sina_weibo_name,
                                       @"qq_weibo_name" : qq_weibo_name,
                                       @"favorited_count" : favorited_count,
                                       @"shared_count" : shared_count,
                                       @"business" : business,
                                       @"education" : education,
                                       @"employment" : employment,
                                       @"location" : location};
  // NSLog(@"%@",userInfoDictionary);
  id object = [baseObject_ bindWithObjec:userInfoDictionary forObjectType:ZHObjectTypeUserInfo];
  
  ZHModel *model = [[ZHModel alloc] init];
  model.object = object;
  //return userInfoDictionary;
  return model;
}

@end
