//
//  ZHQuestionTopicsParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionTopicsParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHQuestionTopicsObject.h"

@interface ZHQuestionTopicsParser ()

@property (nonatomic, strong) NSMutableArray *topicsArray;

@end

@implementation ZHQuestionTopicsParser

- (id)parser
{
  self.topicsArray = [NSMutableArray array];
  NSData *data = [ZHLoadJSONFile DetailAnswerTopicsData];
  
  NSDictionary *dictionary = [data objectFromJSONData];
  
  NSArray *dataArray = [dictionary valueForKey:@"data"];
  
  for (NSDictionary *dic in dataArray) {
    
    NSString *avatar_url = [dic valueForKey:@"avatar_url"];
    NSString *excerpt = [dic valueForKey:@"excerpt"];
    NSString *name = [dic valueForKey:@"name"];
    NSString *type = [dic valueForKey:@"type"];
    NSString *introduction = [dic valueForKey:@"introduction"];
  
  	NSMutableDictionary *topicDic = [NSMutableDictionary dictionary];
    if (avatar_url) {
      [topicDic setObject:avatar_url forKey:@"avatar_url"];
    }
    
    if (excerpt) {
      [topicDic setObject:excerpt forKey:@"excerpt"];
    }
    
    if (name) {
      [topicDic setObject:name forKey:@"name"];
    }
    
    if (type) {
      [topicDic setObject:type forKey:@"type"];
    }
    
    if (introduction) {
      [topicDic setObject:introduction forKey:@"introduction"];
    }
    
    ZHQuestionTopicsObject *topicObject = [ZHQuestionTopicsObject objectWithData:topicDic];
    [self.topicsArray addObject:topicObject];
  }
  
  ZHModel *model = [[ZHModel alloc] init];
  model.objects = self.topicsArray;
	return model;
}

@end
