//
//  ZHFeedsParserFactory.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsParserFactory.h"

@implementation ZHFeedsParserFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHFeedsParser alloc] init];
}

@end
