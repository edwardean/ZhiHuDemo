//
//  ZHAnswerDataParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerFactory.h"

@implementation ZHAnswerFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHAnswerParser alloc] init];
}

@end
