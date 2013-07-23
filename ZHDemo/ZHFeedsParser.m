//
//  ZHFeedsParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHFeedsObject.h"

@interface ZHFeedsParser ()

@property (nonatomic, strong) NSMutableArray *feedArray;

@end

@implementation ZHFeedsParser

- (id)parser
{
  self.feedArray = [NSMutableArray arrayWithCapacity:0];
  
	NSData *data = [ZHLoadJSONFile FeedsData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  
  NSArray *dataArray = [dictionary objectForKey:@"data"];
  
  for (NSDictionary *dic in dataArray) {
    
    NSArray *actors = [dic objectForKey:@"actors"];
    
    NSDictionary *target = [dic objectForKey:@"target"];
    NSDictionary *author = [target objectForKey:@"author"];
    NSString *avatar_url = [author objectForKey:@"avatar_url"];
    NSString *excerpt = [target objectForKey:@"excerpt"];
    NSDictionary *question = [target objectForKey:@"question"];
    NSString *title = [question objectForKey:@"title"];
    NSString *voteup_count = [question objectForKey:@"voteup_count"];
  
    
    NSMutableDictionary *feedsDic = [NSMutableDictionary dictionary];
    if (actors) {
      [feedsDic setObject:actors forKey:@"actors"];
    }
    if (avatar_url) {
    	[feedsDic setObject:avatar_url forKey:@"avatar_url"];
    }
    if (excerpt) {
      [feedsDic setObject:excerpt forKey:@"excerpt"];
    }
    if (title) {
      [feedsDic setObject:title forKey:@"title"];
    }
    if (voteup_count) {
      [feedsDic setObject:voteup_count forKey:@"voteup_count"];
    }
    
    ZHFeedsObject *object  =[ZHFeedsObject objectWithData:feedsDic];
    [self.feedArray addObject:object];
  }
  ZHModel *model = [[ZHModel alloc] init];
  model.objects = self.feedArray;
  return model;
}

@end
