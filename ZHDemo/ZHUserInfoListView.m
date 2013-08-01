//
//  ZHUserInfoListView.m
//  ZHDemo
//
//  Created by Edward on 13-7-19.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoListView.h"
#import <QuartzCore/QuartzCore.h>

@interface ZHUserInfoListView ()

@property (nonatomic) CGFloat lastConfiguresHeight;
@property (nonatomic, retain) CALayer *backgroundLayer;
@property (nonatomic, retain) UIImage *backgroundImage;
@end

@implementation ZHUserInfoListView
@synthesize lastConfiguresHeight = lastConfiguresHeight_;
@synthesize backgroundLayer = backgroundLayer_;
@synthesize backgroundImage = backgroundImage_;

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
