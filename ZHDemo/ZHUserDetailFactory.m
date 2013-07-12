//
//  ZHUserDetailDataParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserDetailFactory.h"

@implementation ZHUserDetailFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHUserDetailParser alloc] init];
}

@end
