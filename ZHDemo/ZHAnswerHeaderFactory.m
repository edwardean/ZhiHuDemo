//
//  ZHAnswerHeaderFactory.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderFactory.h"

@implementation ZHAnswerHeaderFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHAnswerHeaderParser alloc] init];
}

@end
