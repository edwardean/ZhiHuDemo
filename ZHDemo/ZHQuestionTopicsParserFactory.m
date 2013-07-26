//
//  ZHQuestionTopicsParserFactory.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionTopicsParserFactory.h"
#import "ZHQuestionTopicsParser.h"

@implementation ZHQuestionTopicsParserFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHQuestionTopicsParser alloc] init];
}

@end
