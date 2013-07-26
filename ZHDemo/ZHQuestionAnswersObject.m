//
//  ZHQuestionAnswersObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionAnswersObject.h"

@implementation ZHQuestionAnswersObject

- (id)init
{
	self = [super init];
  
  if (self) {
    
  }
  return self;
}

+ (ZHQuestionAnswersObject *)objectWithData:(id)data
{
	if ([[self class] checkObject:data]) {
    ZHQuestionAnswersObject *object = [[ZHQuestionAnswersObject alloc] init];
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
	self.comment_count = [dictionary valueForKey:@"comment_count"];
  self.excerpt = [dictionary valueForKey:@"excerpt"];
  self.voteup_count = [dictionary valueForKey:@"voteup_count"];
	self.name = [dictionary valueForKey:@"name"];
  self.headline = [dictionary valueForKey:@"headline"];
  self.avatar_url = [dictionary valueForKey:@"avatar_url"];
	self.gender = [dictionary valueForKey:@"gender"];
}

+ (BOOL)checkObject:(id)object
{
  if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}

@end
