//
//  ZHQuestionAnswersParserFactory.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionAnswersParserFactory.h"
#import "ZHQuestionAnswersParser.h"

@implementation ZHQuestionAnswersParserFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHQuestionAnswersParser alloc] init];
}

@end
