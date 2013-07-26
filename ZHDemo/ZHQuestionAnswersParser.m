//
//  ZHQuestionAnswersParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionAnswersParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHQuestionAnswersObject.h"

@interface ZHQuestionAnswersParser ()

@property (nonatomic, strong) NSMutableArray *answersArray;

@end

@implementation ZHQuestionAnswersParser

- (id)parser
{
	self.answersArray = [NSMutableArray array];
  NSData *data = [ZHLoadJSONFile DetailAnswerAnswersData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  NSArray *dataArray = [dictionary objectForKey:@"data"];
  
  for (NSDictionary *dic in dataArray) {
    NSString *comment_count = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"comment_count"] integerValue]];
    NSString *excerpt = [dic valueForKey:@"excerpt"];
    NSString *voteup_count = [NSString stringWithFormat:@"%d",[[dic valueForKey:@"voteup_count"]integerValue]];
    
    NSDictionary *author = [dic valueForKey:@"author"];
    NSString *headline = [author valueForKey:@"headline"];
    NSString *avatar_url = [author valueForKey:@"avatar_url"];
    NSString *name = [author valueForKey:@"name"];
    NSString *gender = [NSString stringWithFormat:@"%d",[[author valueForKey:@"gender"]integerValue]];
    
    NSMutableDictionary *answerDic = [NSMutableDictionary dictionary];
    if (comment_count) {
      [answerDic setObject:comment_count forKey:@"comment_count"];
    }
    if (excerpt) {
      [answerDic setObject:excerpt forKey:@"excerpt"];
    }
    if (voteup_count) {
      [answerDic setObject:voteup_count forKey:@"voteup_count"];
    }
    if (headline) {
      [answerDic setObject:headline forKey:@"headline"];
    }
    if (avatar_url) {
      [answerDic setObject:avatar_url forKey:@"avatar_url"];
    }
    if (name) {
      [answerDic setObject:name forKey:@"name"];
    }
    if (gender) {
      [answerDic setObject:gender forKey:@"gender"];
    }
    
    ZHQuestionAnswersObject *answerObject = [ZHQuestionAnswersObject objectWithData:answerDic];
    [self.answersArray addObject:answerObject];
  }
  ZHModel *model = [[ZHModel alloc] init];
  model.objects = self.answersArray;
  
  return model;
}
@end
