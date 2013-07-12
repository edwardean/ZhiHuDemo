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
@synthesize description = description_;
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
    self.type = ZHObjectTypeUserInfo;
  }
  return self;
}

- (id)bindWithObjec:(id)object forObjectType:(ZHObjectType)objecttype
{
  ZHUserInfoObject *userInfoObject = [[ZHUserInfoObject alloc] init];
	if (objecttype != userInfoObject.type) {
    return nil;
  }
	NSDictionary *dictionary = (NSDictionary *)object;
  userInfoObject.name = [dictionary objectForKey:@"name"];
  userInfoObject.headline = [dictionary objectForKey:@"headline"];
  userInfoObject.description = [dictionary objectForKey:@"description"];
  userInfoObject.avatar_url = [dictionary objectForKey:@"avatar_url"];
  userInfoObject.gender = [dictionary objectForKey:@"gender"];
  userInfoObject.following_topic_count = [dictionary objectForKey:@"following_topic_count"];
  userInfoObject.following_count = [dictionary objectForKey:@"following_count"];
  userInfoObject.follower_count = [dictionary objectForKey:@"follower_count"];
  userInfoObject.voteup_count = [dictionary objectForKey:@"voteup_count"];
  userInfoObject.thanked_count = [dictionary objectForKey:@"thanked_count"];
  userInfoObject.answer_count = [dictionary objectForKey:@"answer_count"];
  userInfoObject.question_count = [dictionary objectForKey:@"question_count"];
  userInfoObject.favorite_count = [dictionary objectForKey:@"favorite_count"];
  userInfoObject.favorited_count = [dictionary objectForKey:@"favorited_count"];
  userInfoObject.sina_weibo_name = [dictionary objectForKey:@"sina_weibo_name"];
  userInfoObject.qq_weibo_name = [dictionary objectForKey:@"qq_weibo_name"];
  userInfoObject.shared_count = [dictionary objectForKey:@"shared_count"];
  userInfoObject.business = [dictionary objectForKey:@"business"];
  userInfoObject.education = [dictionary objectForKey:@"education"];
  userInfoObject.employment = [dictionary objectForKey:@"employment"];
  userInfoObject.location = [dictionary objectForKey:@"location"];
  return userInfoObject;
}

@end
