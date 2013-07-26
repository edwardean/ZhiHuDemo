//
//  ZHQuestionHeaderParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHLoadJSONFile.h"
#import "ZHQuestionHeaderObject.h"
#import "ZHQuestionHeaderParser.h"

@implementation ZHQuestionHeaderParser

- (id)parser
{
  NSData *data = [ZHLoadJSONFile DetailAnswerQuestionData];
  NSDictionary *dic = [data objectFromJSONData];
  
  
  NSString *title = [dic valueForKey:@"title"];
  
  NSString *excerpt = [dic valueForKey:@"excerpt"];
  
  NSString *comment_count = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"comment_count"] integerValue]];
  
  NSString *follower_count = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"follower_count"] integerValue]];
  
  NSMutableDictionary *headerDic = [NSMutableDictionary dictionary];
  if (title) {
    [headerDic setObject:title forKey:@"title"];
  }
  if (excerpt) {
    [headerDic setObject:excerpt forKey:@"excerpt"];
  }
  if (comment_count) {
    [headerDic setObject:comment_count forKey:@"comment_count"];
  }
  
  if (follower_count) {
    [headerDic setObject:follower_count forKey:@"follower_count"];
  }
  
  ZHQuestionHeaderObject *headerObject = [ZHQuestionHeaderObject objectWithData:headerDic];
  
  ZHModel *model = [[ZHModel alloc] init];
  model.object = headerObject;
  return model;
}

@end
