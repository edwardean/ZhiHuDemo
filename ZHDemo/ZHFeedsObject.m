//
//  ZHFeedsObject.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsObject.h"

@implementation ZHFeedsObject
@synthesize excerpt = excerpt_;
@synthesize voteup_count = voteup_count_;
@synthesize title = title_;
@synthesize avata_url = avata_url_;
@synthesize actors = actors_;


- (id)init
{
	self = [super init];
  if (self) {
    
  }
  return self;
}

+ (ZHFeedsObject *)objectWithData:(id)data
{
  if ([[self class] checkObject:data]) {
    ZHFeedsObject *object = [[ZHFeedsObject alloc] init];
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
	self.avata_url = [dictionary objectForKey:@"avatar_url"];
  self.excerpt = [dictionary objectForKey:@"excerpt"];
  self.title = [dictionary objectForKey:@"title"];
  self.voteup_count = [dictionary objectForKey:@"voteup_count"];
}

+ (BOOL)checkObject:(id)object
{
  if (![object isKindOfClass:[NSDictionary class]]) {
    return NO;
  }
	return YES;
}
@end
