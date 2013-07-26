//
//  ZHQuestionTopicsObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionTopicsObject.h"

@implementation ZHQuestionTopicsObject

- (id)init
{
	self = [super init];
  
  if (self) {
    
  }
  
  return self;
}


+ (ZHQuestionTopicsObject *)objectWithData:(id)data
{
	if ([[self class] checkObject:data]) {
    ZHQuestionTopicsObject *topicObject = [[ZHQuestionTopicsObject alloc] init];
    [topicObject bindWithObject:data];
    return topicObject;
  }
  return nil;
}

+ (BOOL)checkObject:(id)data
{
  if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}

- (void)bindWithObject:(id)object
{
	if ([[self class] checkObject:object]) {
    [self bindObject:object];
  }
}

- (void)bindObject:(NSDictionary *)dic
{
	self.avatar_url = [dic valueForKey:@"avatar_url"];
  self.excerpt = [dic valueForKey:@"excerpt"];
  self.type = [dic valueForKey:@"name"];
  self.name = [dic valueForKey:@"type"];
  self.introduction = [dic valueForKey:@"introduction"];
}

@end
