//
//  main.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZHAppDelegate.h"
#import "ZHDataParserFactory.h"
#import "ZHCollectionFactory.h"

int main(int argc, char *argv[])
{
  @autoreleasepool {
    
    ZHCollectionFactory *collection = [ZHCollectionFactory DataParserFactory];
    
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([ZHAppDelegate class]));
  }
}
