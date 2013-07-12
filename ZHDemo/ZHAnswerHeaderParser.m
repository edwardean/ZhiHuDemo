//
//  ZHAnswerHeaderParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHObject.h"

@interface ZHAnswerHeaderParser ()

@property (nonatomic) ZHObject *baseObject;

@end

@implementation ZHAnswerHeaderParser

@synthesize baseObject = baseObject_;

- (id)parser
{
  self.baseObject = [[ZHObject alloc]init];
  
	NSData *data = [ZHLoadJSONFile AnswerHeaderData];
  NSDictionary *dictonary = [data objectFromJSONData];
  
	NSString *title = [dictonary objectForKey:@"title"];
  
  NSString *description = [dictonary objectForKey:@"description"];
  
  NSString *follower_count = [NSString stringWithFormat:@"%d",[[dictonary objectForKey:@"follower_count"] integerValue]];
  
  NSString *comment_count = [NSString stringWithFormat:@"%d",[[dictonary objectForKey:@"comment_count"] integerValue]];
  
  NSDictionary *creator = [dictonary objectForKey:@"creator"];
  NSString *name = [creator objectForKey:@"name"];
  
  NSString *avatar_url = [creator objectForKey:@"avatar_url"];
  
  
  NSDictionary *answerHeaderDictinary = @{@"title": title,
                                          @"description":description,
                                          @"follower_count":follower_count,
                                          @"comment_count":comment_count,
                                          @"name":name,
                                          @"avatar_url":avatar_url};
  NSLog(@"AnsHeader:%@",answerHeaderDictinary);
  id object = [self.baseObject bindWithObjec:answerHeaderDictinary forObjectType:ZHObjectTypeAnswerHeader];
  ZHModel *model = [[ZHModel alloc] init];
  model.object = object;
  //return answerHeaderDictinary;
  return model;
}

@end
