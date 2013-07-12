//
//  ZHUserInfoDataParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoFactory.h"

@implementation ZHUserInfoFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHUserInfoParser alloc] init];
}

@end
