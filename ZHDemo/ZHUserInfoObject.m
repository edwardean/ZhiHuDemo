//
//  ZHUserInfoObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoObject.h"

@implementation ZHUserInfoObject

@synthesize name = name_;
@synthesize headline = headline_;
@synthesize des = des_;
@synthesize avatar_url = avatar_url_;
@synthesize gender = gender_;
@synthesize following_topic_count = following_topic_count_;
@synthesize following_count = following_count_;
@synthesize follower_count = follower_count_;
@synthesize voteup_count = voteup_count_;
@synthesize thanked_count = thanked_count_;
@synthesize answer_count = answer_count_;
@synthesize question_count = question_count_;
@synthesize favorite_count = favorite_count_;
@synthesize favorited_count = favorited_count_;
@synthesize sina_weibo_name = sina_weibo_name_;
@synthesize qq_weibo_name = qq_weibo_name_;
@synthesize shared_count = shared_count_;
@synthesize business = business_;
@synthesize education = education_;
@synthesize employment = employment_;
@synthesize location = location_;

- (id)init
{
	self = [super init];
  if (self) {
  }
  return self;
}

+ (ZHUserInfoObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHUserInfoObject *userinfoObject = [[ZHUserInfoObject alloc] init];
    [userinfoObject bindWithObject:data];
    return userinfoObject;
  }
	return nil;
}

- (void)bindWithObject:(id)object
{
	if ([[self class] checkObject:object]) {
    NSDictionary *dic = (NSDictionary *)object;
    [self bind:dic];
  }
}

- (void)bind:(NSDictionary *)dictionary
{
	self.name = [dictionary objectForKey:@"name"];
  self.headline = [dictionary objectForKey:@"headline"];
  self.des = [dictionary objectForKey:@"description"];
  self.avatar_url = [dictionary objectForKey:@"avatar_url"];
  self.gender = [dictionary objectForKey:@"gender"];
  self.following_topic_count = [dictionary objectForKey:@"following_topic_count"];
  self.following_count = [dictionary objectForKey:@"following_count"];
  self.follower_count = [dictionary objectForKey:@"follower_count"];
  self.voteup_count = [dictionary objectForKey:@"voteup_count"];
  self.thanked_count = [dictionary objectForKey:@"thanked_count"];
  self.answer_count = [dictionary objectForKey:@"answer_count"];
  self.question_count = [dictionary objectForKey:@"question_count"];
  self.favorite_count = [dictionary objectForKey:@"favorite_count"];
  self.favorited_count = [dictionary objectForKey:@"favorited_count"];
  self.sina_weibo_name = [dictionary objectForKey:@"sina_weibo_name"];
  self.qq_weibo_name = [dictionary objectForKey:@"qq_weibo_name"];
  self.shared_count = [dictionary objectForKey:@"shared_count"];
  self.business = [dictionary objectForKey:@"business"];
  self.education = [dictionary objectForKey:@"education"];
  self.employment = [dictionary objectForKey:@"employment"];
  self.location = [dictionary objectForKey:@"location"];
}

+ (BOOL)checkObject:(id)object
{
	if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  
  return YES;
}

@end
