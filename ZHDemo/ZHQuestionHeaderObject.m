//
//  ZHQuestionHeaderObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionHeaderObject.h"

@implementation ZHQuestionHeaderObject

- (id)init
{
	self = [super init];
  if (self) {
    
  }
  return self;
}

+ (ZHQuestionHeaderObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHQuestionHeaderObject *headerObject = [[ZHQuestionHeaderObject alloc] init];
    [headerObject bindWithObject:data];
    return headerObject;
  }
	return nil;
}

- (void)bindWithObject:(id)object
{
	if ([[self class] checkObject:object]) {
    [self bindObject:object];
  }
}

- (void)bindObject:(NSDictionary *)dic
{
	self.title = [dic valueForKey:@"title"];
  self.excerpt = [dic valueForKey:@"excerpt"];
  self.follower_count = [dic valueForKey:@"follower_count"];
  self.comment_count = [dic valueForKey:@"comment_count"];
}

+ (BOOL)checkObject:(id)data
{
	if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  return YES;
}

@end
