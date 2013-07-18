//
//  ZHAnswerParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHAnswerObject.h"

#import "ZHCollectionObject.h"

@interface ZHAnswerParser ()

@property (nonatomic) NSMutableArray *answerArray;

@end

@implementation ZHAnswerParser

@synthesize answerArray = answerArray_;

- (id)parser
{
  self.answerArray = [NSMutableArray array];
  
	NSData *data = [ZHLoadJSONFile AnswerData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  NSArray *dataArray = [dictionary objectForKey:@"data"];
  
  for (NSDictionary *dic in dataArray) {
    
    NSString *voteup_count = [NSString stringWithFormat:@"%d",
                              [[dic objectForKey:@"voteup_count"]
                               integerValue]];
    NSString *excerpt = [dic objectForKey:@"excerpt"];
    
    NSDictionary *question = [dic objectForKey:@"question"];
    NSString *title = [question objectForKey:@"title"];
    
    NSDictionary *author = [dic objectForKey:@"author"];
    NSString *avatar_url = [author objectForKey:@"avatar_url"];
    
    NSMutableDictionary *answerDictionary = [NSMutableDictionary dictionary];
    
    if (voteup_count) {
      [answerDictionary setObject:voteup_count forKey:@"voteup_count"];
    }
    if (excerpt) {
      [answerDictionary setObject:excerpt forKey:@"excerpt"];
    }
    if (title) {
      [answerDictionary setObject:title forKey:@"title"];
    }
    if (avatar_url) {
      [answerDictionary setObject:avatar_url forKey:@"avatar_url"];
    }
    
    ZHAnswerObject *object = [ZHAnswerObject objectWithData:answerDictionary];
    
    [self.answerArray addObject:object];
  }
  
  ZHModel *model = [[ZHModel alloc] init];
  
  model.objects = self.answerArray;
  
  return model;
}

@end
