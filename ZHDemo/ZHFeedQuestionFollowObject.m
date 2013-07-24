//
//  ZHFeedQuestionFollowObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedQuestionFollowObject.h"

@implementation ZHFeedQuestionFollowObject

+ (ZHFeedQuestionFollowObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHFeedQuestionFollowObject *object = [[ZHFeedQuestionFollowObject alloc] init];
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
  self.title = [dictionary valueForKey:@"title"];
  self.avatar_url = [dictionary valueForKey:@"avatar_url"];
  self.actors = [dictionary valueForKey:@"actors"];
}

+ (BOOL)checkObject:(id)object
{
  if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}

@end
