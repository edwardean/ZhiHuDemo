//
//  ZHCollectionDataParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionFactory.h"

@implementation ZHCollectionFactory

+ (ZHParser *)ParserFactory
{
	return [[ZHCollectionParser alloc] init];
}

@end
