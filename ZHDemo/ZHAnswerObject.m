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
  }
  return self;
}


+ (ZHAnswerObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHAnswerObject *answerObject = [[ZHAnswerObject alloc]init];
    [answerObject bindWithObject:data];
    return answerObject;
  }
  return nil;
}

- (void)bindWithObject:(id)object
{
  if ([[self class] checkObject:object]) {
    [self bind:object];
  }
}

- (void)bind:(NSDictionary *)dictionary
{
  self.title = [dictionary objectForKey:@"title"];
  self.excerpt = [dictionary objectForKey:@"excerpt"];
  self.avatar_url = [dictionary objectForKey:@"avatar_url"];
  self.voteup_count = [dictionary objectForKey:@"voteup_count"];
}

+ (BOOL)check
{
	if (![[self class] isSubclassOfClass:[ZHAnswerObject class]]) {
    NSLog(@"NO Class:%@",[self class]);
    return NO;
  }
  NSLog(@"YES Class:%@",[self class]);
  return YES;
}

+ (BOOL)checkObject:(id)object
{
	if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  
  return YES;
}

@end
