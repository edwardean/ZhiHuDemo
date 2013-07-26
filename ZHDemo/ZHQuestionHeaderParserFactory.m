//
//  ZHQuestionHeaderParserFactory.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionHeaderParserFactory.h"
#import "ZHQuestionHeaderParser.h"

@implementation ZHQuestionHeaderParserFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHQuestionHeaderParser alloc] init];
}

@end
