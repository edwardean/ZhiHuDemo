//
//  ZHFeedAnswerObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedAnswerObject.h"

@implementation ZHFeedAnswerObject

+ (ZHFeedAnswerObject *)objectWithData:(id)data
{
	if ([[self class] checkObject:data]) {
    ZHFeedAnswerObject *object = [[ZHFeedAnswerObject alloc] init];
    [object bindWithObject:data];
    return object;
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
	self.verb = [dictionary valueForKey:@"verb"];
  self.name = [dictionary objectForKey:@"name"];
  self.avatar_url = [dictionary objectForKey:@"avatar_url"];
  self.excerpt = [dictionary objectForKey:@"excerpt"];
  self.title = [dictionary objectForKey:@"title"];
  self.voteup_count = [dictionary objectForKey:@"voteup_count"];
  self.actors = [dictionary objectForKey:@"actors"];
}

+ (BOOL)checkObject:(id)object
{
  if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}

@end
