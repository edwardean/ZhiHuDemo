//
//  ZHUserInfoListView.m
//  ZHDemo
//
//  Created by Edward on 13-7-19.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoListView.h"

@implementation ZHUserInfoListView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame style:UITableViewStyleGrouped];
  
  if (self) {
    
    [self setBackgroundView:nil];
    
    [self setBackgroundColor:[UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"BackgroundTextures.png"]]];
  }
  return self;
}

@end
