//
//  ZHCollectionObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionObject.h"

@implementation ZHCollectionObject
@synthesize title = title_;
@synthesize des = des_;
@synthesize avatarURL = avatarURL_;
@synthesize name = name_;
@synthesize answerCOUNT = answerCOUNT_;

- (id)init
{
	self = [super init];
  if (self) {
    
  }
  return self;
}


+ (ZHCollectionObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHCollectionObject *collectionObject = [[ZHCollectionObject alloc] init];
    [collectionObject bindWithObject:data];
    return collectionObject;
	}
	
  return nil;
}

- (void)bindWithObject:(id)data
{
  if ([[self class] checkObject:data]) {
    [self bindObject:data];
  }
}

- (void)bindObject:(NSDictionary *)dic
{
	self.title = [dic objectForKey:@"title"];
  self.des = [dic objectForKey:@"description"];
  self.name = [dic objectForKey:@"name"];
  self.avatarURL = [dic objectForKey:@"avatar_url"];
  self.answerCOUNT = [dic objectForKey:@"answer_count"];
}


+ (BOOL)checkObject:(id)data
{
  if (![data isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}

@end
