//
//  ZHConfig.m
//  ZHDemo
//
//  Created by Edward on 13-7-28.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHConfig.h"

@implementation ZHConfig


NSUInteger DeviceSystemMajorVersion() {
  static NSUInteger _deviceSystemMajorVersion = -1;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion]
                                   componentsSeparatedByString:@"."]
                                  objectAtIndex:0] intValue];
  });
  return _deviceSystemMajorVersion;
}

@end
