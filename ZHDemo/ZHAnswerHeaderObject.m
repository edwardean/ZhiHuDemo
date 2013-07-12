//
//  ZHAnswerHeaderObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderObject.h"

@implementation ZHAnswerHeaderObject

@synthesize title = title_;
@synthesize description = description_;
@synthesize avatar_url = avatar_url_;
@synthesize name = name_;
@synthesize follower_count = follower_count_;
@synthesize comment_count = comment_count_;

- (id)init
{
	self = [super init];
  if (self) {
    self.type = ZHObjectTypeAnswerHeader;
  }
  return self;
}

- (id)bindWithObjec:(id)object forObjectType:(ZHObjectType)objecttype
{
  ZHAnswerHeaderObject *answerHeaderObject = [[ZHAnswerHeaderObject alloc] init];

	if (objecttype != answerHeaderObject.type) {
    return nil;
  }
  NSDictionary *dictionary = (NSDictionary *)object;
  
  
  answerHeaderObject.title = [dictionary objectForKey:@"title"];
  answerHeaderObject.description = [dictionary objectForKey:@"description"];
  answerHeaderObject.avatar_url = [dictionary objectForKey:@"avatar_url"];
  answerHeaderObject.name = [dictionary objectForKey:@"name"];
  answerHeaderObject.follower_count = [dictionary objectForKey:@"follower_count"];
  answerHeaderObject.comment_count = [dictionary objectForKey:@"comment_count"];
  return answerHeaderObject;
}

@end
