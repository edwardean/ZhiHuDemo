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
@synthesize avatar_url = avatar_url_;
@synthesize name = name_;
@synthesize answer_count = answer_count_;

- (id)init
{
	self = [super init];
  if (self) {
    self.type = ZHObjectTypeCollection;
  }
  return self;
}

- (id)bindWithObjec:(id)object forObjectType:(ZHObjectType)objecttype
{
  ZHCollectionObject *collectionObject = [[ZHCollectionObject alloc] init];
  
	if (objecttype != collectionObject.type) {
    
    return nil;
  }
  NSDictionary *dictionary = (NSDictionary *)object;
  collectionObject.title = [dictionary objectForKey:@"title"];
  collectionObject.des = [dictionary objectForKey:@"description"];
  collectionObject.name = [dictionary objectForKey:@"name"];
  collectionObject.avatar_url = [dictionary objectForKey:@"avatar_url"];
  collectionObject.answer_count = [dictionary objectForKey:@"answer_count"];
  return collectionObject;
}

@end
