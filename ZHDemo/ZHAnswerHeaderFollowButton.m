//
//  ZHAnswerHeaderFollowButton.m
//  ZHDemo
//
//  Created by Edward on 13-7-15.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerHeaderFollowButton.h"

@interface ZHAnswerHeaderFollowButton ()

@property (nonatomic) UIImageView *followButtonImageView;

@property (nonatomic) UIImage *normalImage;
@property (nonatomic) UIImage *normalHighlightImage;
@property (nonatomic) UIImage *followedImage;
@property (nonatomic) UIImage *followedHighlightImage;

@property (nonatomic) BOOL isFollowed;

@end

@implementation ZHAnswerHeaderFollowButton

@synthesize followButtonImageView = followButtonImageView_;
@synthesize normalImage = normalImage_;
@synthesize followedImage = followedImage_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    
    //CGRect followButtonRect = CGRectMake(0, 0, 76, 31);
    self.isFollowed = NO;
    
    //      UIImage *uncheckedNormalImage;
    //      UIImage *uncheckedHighlightedImage;
    //      UIImage *checkedNormalImage;
    //      UIImage *checkedHighlightedImage;
    
    self.normalImage = [UIImage imageNamed:@"ZHFollowButtonNormal.png"];
    self.normalHighlightImage = [UIImage imageNamed:@"ZHFollowButtonHighlight.png"];
    self.followedImage = [UIImage imageNamed:@"ZHFeaturedButtonNormal.png"];
    self.followedHighlightImage = [UIImage imageNamed:@"ZHFeaturedButtonHighlight.png"];
    
    // CGPoint point = frame.origin;
    //CGSize size = followButtonRect.size;
    if (!followButtonImageView_) {
      self.followButtonImageView = [[UIImageView alloc]
                                    initWithFrame:CGRectMake(0,
                                                             0,
                                                             76,
                                                             31)];
    }
    [self.followButtonImageView setImage:self.normalImage];
    
    //      [self setCheckImage:uncheckedNormalImage forCheckBoxState:NO];
    //      [self setCheckImage:checkedNormalImage forCheckBoxState:YES];
    
    [self addSubview:followButtonImageView_];
    
    [self addTarget:self
             action:@selector(changeState)
   forControlEvents:UIControlEventTouchUpInside];
  }
  return self;
}

- (void)changeState
{
  if (self.isHighlighted && self.isFollowed) {
		[self.followButtonImageView setImage:self.followedHighlightImage];
  } else if (!self.isHighlighted && self.isFollowed) {
  	[self.followButtonImageView setImage:self.followedImage];
  } else if (self.isHighlighted && !self.isFollowed) {
  	[self.followButtonImageView setImage:self.normalHighlightImage];
  } else {
  	[self.followButtonImageView setImage:self.normalImage];
  }
}

//- (void)setCheckImage:(UIImage *)image
//       forFollowState:(BOOL)isFollowed
//       highlightState:(BOOL)isHighlight
//{
//	if (isFollowed && !isHighlight) {
//    self.followedImage = image;
//  } else if (isFollowed && isHighlight) {
//  	self.followedHighlightImage = image;
//  } else if (!isFollowed && !isHighlight) {
//  	self.normalImage = image;
//  } else {
//  	self.normalHighlightImage = image;
//  }
//}
//
//- (void)setCheckImage:(UIImage *)image forCheckBoxState:(BOOL)isChecked
//{
//	if (isChecked) {
//    self.followedImage = image;
//  } else {
//  	self.normalImage = image;
//  }
//}

- (void)setHighlighted:(BOOL)highlighted
{
  if (highlighted) {
    NSLog(@"Highlight");
  } else {
  	NSLog(@"Not Highlight");
  }
	if (highlighted && self.isFollowed) {
		[self.followButtonImageView setImage:self.followedHighlightImage];
  } else if (!highlighted && self.isFollowed) {
  	[self.followButtonImageView setImage:self.followedImage];
  } else if (highlighted && !self.isFollowed) {
  	[self.followButtonImageView setImage:self.normalHighlightImage];
  } else {
  	[self.followButtonImageView setImage:self.normalImage];
  }
  
}

- (void)setSelected:(BOOL)selected
{
	self.isFollowed = selected;
  if (selected) {
    NSLog(@"selected");
  } else {
  	NSLog(@"Not selected");
  }
}

@end
