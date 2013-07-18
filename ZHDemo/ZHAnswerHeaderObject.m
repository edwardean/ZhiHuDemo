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
@synthesize des = des_;
@synthesize avatarURL = avatarURL_;
@synthesize name = name_;
@synthesize followerCOUNT = followerCOUNT_;
@synthesize commentCOUNT = commentCOUNT_;

- (id)init
{
	self = [super init];
  if (self) {
  }
  return self;
}

+ (ZHAnswerHeaderObject *)objectWithData:(id)data
{
	if ([[self class] checkObject:data]) {
    ZHAnswerHeaderObject *headerObject = [[ZHAnswerHeaderObject alloc] init];
    [headerObject bindWithObject:data];
    return headerObject;
  }
  
  return nil;
}

- (void)bindWithObject:(id)object
{
	if ([[self class] checkObject:object]) {
    NSDictionary *dictionary = (NSDictionary *)object;
    self.title = [dictionary objectForKey:@"title"];
    self.des = [dictionary objectForKey:@"description"];
    self.avatarURL = [dictionary objectForKey:@"avatar_url"];
    self.name = [dictionary objectForKey:@"name"];
    self.followerCOUNT = [dictionary objectForKey:@"follower_count"];
    self.commentCOUNT = [dictionary objectForKey:@"comment_count"];
  }
}


+ (BOOL)checkObject:(id)object
{
	if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
  
  return YES;
}

@end
