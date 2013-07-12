//
//  ZHDataParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHDataParserFactory.h"

@implementation ZHDataParserFactory

+ (ZHParser *)ParserFactory
{
	[NSException raise:NSInternalInconsistencyException
              format:@"%@的子类必须重写%@方法",
   [NSString stringWithUTF8String:object_getClassName(self)],
   NSStringFromSelector(_cmd)];
  
	return nil;
}

@end
