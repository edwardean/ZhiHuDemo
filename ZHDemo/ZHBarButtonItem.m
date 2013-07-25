//
//  ZHBarButtonItem.m
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHBarButtonItem.h"
#import <objc/runtime.h>

@interface ZHBarButtonItem () {
	NSMutableArray *blocks;
}

- (void)handleBlock;

@end

@implementation ZHBarButtonItem

- (void)handleBlock
{
  dispatch_block_t block = [blocks objectAtIndex:0];
  block();
}


+ (ZHBarButtonItem *)BarButtonItemWithImage:(UIImage *)image
                                      block:(dispatch_block_t)block
{
	return [[ZHBarButtonItem alloc] initBarButtonItemWithImage:image block:block];
}

- (id)initBarButtonItemWithImage:(UIImage *)image block:(dispatch_block_t)block
{
	self = [super init];
  if (self) {
        
    UIImage *barNormalImage = [[UIImage imageNamed:@"NavigationBarButtonNormal.png"]
                               stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    UIImage *barHighImage = [[UIImage imageNamed:@"NavigationBarButtonHighlight.png"]
                             stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    
    CGRect imgRect = CGRectMake(0, 0, 22, 18);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:imgRect];
    [imgView setImage:image];
    
    
    CGRect rect = CGRectInset(imgRect, -10, -5);
    UIButton *barButton = [[UIButton alloc] initWithFrame:rect];
    [barButton setBackgroundImage:barNormalImage forState:UIControlStateNormal];
    [barButton setBackgroundImage:barHighImage forState:UIControlStateHighlighted];
    [barButton addSubview:imgView];
		
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    [imgView setCenter:center];
    
    [self setCustomView:barButton];
    blocks = [[NSMutableArray alloc] init];
    if (!block) {
      block = ^{};
    }
#if !__has_feature(objc_arc)
    [blocks addObject:[[block copy] autorelease]];
#else
    [blocks addObject:[block copy]];
#endif
    
    [barButton addTarget:self action:@selector(handleBlock) forControlEvents:UIControlEventTouchUpInside];
  }
  
  return self;

}


+ (ZHBarButtonItem *)BarButtonItemWithTitle:(NSString *)title
                                      block:(dispatch_block_t)block
{
	return [[ZHBarButtonItem alloc] initBarButtonItemButtonWithTitle:title block:block];
}

- (id)initBarButtonItemButtonWithTitle:(NSString *)title
                                 block:(dispatch_block_t)block
{
	self = [super init];
  if (self) {
    UIImage *barNormalImage = [[UIImage imageNamed:@"NavigationBarButtonNormal.png"]
                               stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    UIImage *barHighImage = [[UIImage imageNamed:@"NavigationBarButtonHighlight.png"]
                             stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(320, 20)];
    CGRect rect = CGRectInset(CGRectMake(0, 0, size.width, size.height), -10, -7);
    
    UIButton *barButton = [[UIButton alloc] initWithFrame:rect];
    
    [barButton setBackgroundImage:barNormalImage forState:UIControlStateNormal];
    [barButton setBackgroundImage:barHighImage forState:UIControlStateHighlighted];
    
    [[barButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0f]];
    [[barButton titleLabel] setTextColor:[UIColor whiteColor]];
    [[barButton titleLabel] setShadowColor:[UIColor grayColor]];
    [[barButton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
    [barButton setTitle:title forState:UIControlStateNormal];
    
    [self setCustomView:barButton];
    
    blocks = [[NSMutableArray alloc] init];
    if (!block) {
      block = ^{};
    }
#if !__has_feature(objc_arc)
    [blocks addObject:[[block copy] autorelease]];
#else
    [blocks addObject:[block copy]];
#endif
    
    [barButton addTarget:self action:@selector(handleBlock) forControlEvents:UIControlEventTouchUpInside];
    
  }
	return self;
}

@end
