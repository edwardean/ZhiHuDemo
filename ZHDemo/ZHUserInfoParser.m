//
//  ZHUserInfoParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHUserInfoObject.h"

@interface ZHUserInfoParser ()

@property (nonatomic) ZHUserInfoObject *userInfoObject;

@end

@implementation ZHUserInfoParser

@synthesize userInfoObject = userInfoObject_;

- (id)parser
{
  self.userInfoObject = [[ZHUserInfoObject alloc] init];
  
	NSData *data = [ZHLoadJSONFile UserInfoData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  NSString *following_count = [NSString stringWithFormat:@"%d",
                               [[dictionary objectForKey:@"following_count"]
                                integerValue]];//他关注的人
  
  NSString *following_topic_count = [NSString stringWithFormat:@"%d",
                                     [[dictionary objectForKey:@"following_topic_count"]
                                      integerValue]];//他的话题
  
  NSString *follower_count = [NSString stringWithFormat:@"%d",
                              [[dictionary objectForKey:@"follower_count"]
                               integerValue]];//关注他的人
  
  NSString *name = [dictionary objectForKey:@"name"];//用户名
  
  NSString *headline = [dictionary objectForKey:@"headline"];//用户名旁边的介绍
  
  NSString *description = [dictionary objectForKey:@"description"];//头像下边的简介
  
  NSNumber *gender = [dictionary objectForKey:@"gender"];//性别，1代表男性  -1代表女性
  
  NSString *avatar_url = [dictionary objectForKey:@"avatar_url"];//头像地址
  
  NSString *favorite_count = [NSString stringWithFormat:@"%d",
                              [[dictionary objectForKey:@"favorite_count"]
                               integerValue]];//他的收藏
  
  NSString *voteup_count = [NSString stringWithFormat:@"%d",
                            [[dictionary objectForKey:@"voteup_count"]
                             integerValue]];//赞过他的人
  
  NSString *thanked_count = [NSString stringWithFormat:@"%d",
                             [[dictionary objectForKey:@"thanked_count"]
                              integerValue]];//喜欢他的人
  
  NSString *answer_count = [NSString stringWithFormat:@"%d",
                            [[dictionary objectForKey:@"answer_count"]
                             integerValue]];//答过
  
  NSString *question_count = [NSString stringWithFormat:@"%d",
                              [[dictionary objectForKey:@"question_count"]
                               integerValue]];//问过
  
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

  NSMutableDictionary *userInfoDictionary = [NSMutableDictionary dictionary];
  
  if ([name length] > 0) {
    [userInfoDictionary setObject:name forKey:@"name"];
  }
  if ([headline length] > 0) {
    [userInfoDictionary setObject:headline forKey:@"headline"];
  }
  if ([description length] > 0) {
    [userInfoDictionary setObject:description forKey:@"description"];
  }
  if ([avatar_url length] > 0) {
    [userInfoDictionary setObject:avatar_url forKey:@"avatar_url"];
  }
  if (gender) {
    [userInfoDictionary setObject:gender forKey:@"gender"];
  }
  if (following_topic_count) {
    [userInfoDictionary setObject:following_topic_count forKey:@"following_topic_count"];
  }
  if (following_count) {
    [userInfoDictionary setObject:following_count forKey:@"following_count"];
  }
  if (follower_count) {
    [userInfoDictionary setObject:follower_count forKey:@"follower_count"];
  }
  if (voteup_count) {
    [userInfoDictionary setObject:voteup_count forKey:@"voteup_count"];
  }
  if (thanked_count) {
    [userInfoDictionary setObject:thanked_count forKey:@"thanked_count"];
  }
  if (answer_count) {
    [userInfoDictionary setObject:answer_count forKey:@"answer_count"];
  }
  if (question_count) {
    [userInfoDictionary setObject:question_count forKey:@"question_count"];
  }
  if (favorite_count) {
    [userInfoDictionary setObject:favorite_count forKey:@"favorite_count"];
  }
  if (favorited_count) {
    [userInfoDictionary setObject:favorited_count forKey:@"favorited_count"];
  }
  if (shared_count) {
    [userInfoDictionary setObject:shared_count forKey:@"shared_count"];
  }
  if (business) {
    [userInfoDictionary setObject:business forKey:@"business"];
  }
  if (education) {
    [userInfoDictionary setObject:education forKey:@"education"];
  }
  if (employment) {
    [userInfoDictionary setObject:employment forKey:@"employment"];
  }
  if (location) {
    [userInfoDictionary setObject:location forKey:@"location"];
  }
  if ([sina_weibo_name length] > 0) {
    [userInfoDictionary setObject:sina_weibo_name forKey:@"sina_weibo_name"];
  }
  if ([qq_weibo_name length] > 0) {
    [userInfoDictionary setObject:qq_weibo_name forKey:@"qq_weibo_name"];
  }
  
  ZHUserInfoObject* object = [userInfoObject_ bindWithObjec:userInfoDictionary forObjectType:ZHObjectTypeUserInfo];
  
  ZHModel *model = [[ZHModel alloc] init];
  model.object = object;
  
  return model;
}

@end
