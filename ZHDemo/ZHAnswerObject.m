//
//  ZHAnswerObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerObject.h"

@implementation ZHAnswerObject
@synthesize title = title_;
@synthesize excerpt = excerpt_;
@synthesize voteup_count = voteup_count_;
@synthesize avatar_url = avatar_url_;

- (id)init
{
	self = [super init];
  if (self) {
    self.type = ZHObjectTypeAnswer;
  }
  return self;
}

- (id)bindWithObjec:(id)object forObjectType:(ZHObjectType)objecttype
{
  ZHAnswerObject *answerObject = [[ZHAnswerObject alloc] init];

  NSDictionary *dictionary = (NSDictionary *)object;
  answerObject.title = [dictionary objectForKey:@"title"];
  answerObject.excerpt = [dictionary objectForKey:@"excerpt"];
  answerObject.avatar_url = [dictionary objectForKey:@"avatar_url"];
  answerObject.voteup_count = [dictionary objectForKey:@"voteup_count"];
  return answerObject;
}

@end
