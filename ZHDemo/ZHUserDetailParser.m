//
//  ZHUserDetailParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserDetailParser.h"
#import "ZHLoadJSONFile.h"

@implementation ZHUserDetailParser

- (id)parser
{
	NSData *data = [ZHLoadJSONFile UserDetailData];
  NSDictionary *dictionary = [data objectFromJSONData];
  
  return nil;
}

@end
