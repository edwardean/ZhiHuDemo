//
//  ZHQuestionTopicView.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionTopicView.h"
#import "UIView+Frame.h"

#define FirstTagToLeftSideMargin   7    //第一个标签距离左边的距离
#define ListArrowButtonRightMargin 10   //右边箭头距离右边的距离
#define MarginBetweenTags          5    //每两个tag标签的间距
#define TagFont                    12.0 //标签的字体大小
#define TagCapWidth                9    //标签文本离背景图片两边的距离
#define TagCapHeightMargin         3    //标签文本距离图片上下两边的距离
#define TagHeight                  22   //标签高度

#define ArrowListButtonWidth       10
#define ArrowListButtonHeight      14

@interface ZHQuestionTopicView ()
{
	CGSize tagSize_;
	
	CGFloat tagLabelOriginX;	//每个标签左边x坐标
}

@property (nonatomic, strong, readwrite) NSArray *tagArray;
@property (nonatomic, strong, readwrite) NSMutableArray *tagLabelArray;
@property (nonatomic, strong, readwrite) NSMutableArray *tagImageArray;
@property (nonatomic, strong, readwrite) UIButton *moreButton;
@property (nonatomic, strong, readwrite) UIFont *font;
@property (nonatomic, strong, readwrite) UIImage *tagBackgroundImage;

@property (nonatomic, strong, readwrite) UILabel *label;
@property (nonatomic, strong, readwrite) UIImageView *imgView;

@end

@implementation ZHQuestionTopicView

@synthesize tagArray 						= tagArray_;
@synthesize moreButton 					= moreButton_;
@synthesize font 								= font_;
@synthesize tagBackgroundImage 	= tagBackgroundImage_;
@synthesize tagLabelArray 			= tagLabelArray_;
@synthesize tagImageArray 			= tagImageArray_;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
    NSLog(@"%s",__func__);
    tagSize_ = CGSizeMake(320, TagHeight);
    self.font = [UIFont systemFontOfSize:TagFont];
    self.label.numberOfLines = 1;
    
    self.tagBackgroundImage = [[UIImage imageNamed:@"ZHQuestionViewTopicBase.png"]
                               stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    
    self.tagLabelArray = [NSMutableArray array];
    self.tagImageArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
      UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
      [imgView setImage:tagBackgroundImage_];
      [imgView setHeight:TagHeight];
      [self.tagImageArray addObject:imgView];
    }
    
    [self setUp];
	}
	return self;
}

- (void)addTagArray:(NSArray *)tags
{
	self.tagArray = tags;
  NSString *tagString;
  UILabel *label;
  NSUInteger count = [tagArray_ count];
  
  [self.tagLabelArray removeAllObjects];
  
  if (count >= 4) {
		for (NSInteger i = 0; i < 4; i++) {
      tagString = [tagArray_ objectAtIndex:i];
      label = [[UILabel alloc] initWithFrame:CGRectZero];
      [label setText:tagString];
      [label setY:TagCapHeightMargin];
      [label setX:TagCapWidth];
      [tagLabelArray_ addObject:label];
    }
  } else {
  	for (NSInteger i = 0; i < count; i++) {
      tagString = [tagArray_ objectAtIndex:i];
      label = [[UILabel alloc] initWithFrame:CGRectZero];
      [label setText:tagString];
      [label setY:TagCapHeightMargin];
      [label setX:TagCapWidth];
      [tagLabelArray_ addObject:label];
    }
  }
  
  for (id img in self.subviews) {
    if ([img isKindOfClass:[UIImageView class]]) {
      [img removeFromSuperview];
     	UIImageView *imgView = (UIImageView *)img;
      for (id lab in imgView.subviews) {
        if ([lab isKindOfClass:[UILabel class]]) {
          [lab removeFromSuperview];
        }
      }
    }
  }
	
  for (NSInteger i = 0; i < [tagLabelArray_ count]; i++) {
    self.label = [tagLabelArray_ objectAtIndex:i];
    self.imgView = [tagImageArray_ objectAtIndex:i];
    [self.label setFont:font_];
    [self.label setTextAlignment:NSTextAlignmentRight];
    [self.label setBackgroundColor:[UIColor clearColor]];
    [self.label setTextColor:[UIColor colorWithRed:0.437
                                             green:0.708
                                              blue:0.943
                                             alpha:1.000]];
    [self.imgView addSubview:self.label];
    [self addSubview:self.imgView];
  }
  
	[self setNeedsLayout];
}

- (void)setUp
{
  // Set the tag backgroundView array, max is 4
  self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
  [moreButton_ setWidth:ArrowListButtonWidth];
  [moreButton_ setHeight:ArrowListButtonHeight];
	[moreButton_ setImage:[UIImage imageNamed:@"ZHListViewArrowRight@2x.png"]
							 forState:UIControlStateNormal];
  
  [moreButton_ setCenterX:(320 - ListArrowButtonRightMargin - [moreButton_ width]/2)];
  [moreButton_ setCenterY:[self height]/2];
  
	[self addSubview:moreButton_];
}

- (void)layoutSubviews
{
	NSLog(@"%s",__func__);
	[super layoutSubviews];
  
	NSString *title;
  UILabel *label;
  UIImageView *tagBackImageView;
  tagLabelOriginX = FirstTagToLeftSideMargin;
  for (NSInteger i = 0; i < [tagLabelArray_ count]; i++) {
    
    label = [tagLabelArray_ objectAtIndex:i];
    tagBackImageView = [tagImageArray_ objectAtIndex:i];
    title = label.text;
    CGSize size = [title sizeWithFont:font_ constrainedToSize:tagSize_];
    
    
    [tagBackImageView setX:tagLabelOriginX];
    [tagBackImageView setWidth:size.width + TagCapWidth * 2];
    
    [label setWidth:size.width];
    [label setHeight:size.height];
    
    [tagBackImageView setCenterY:[self height] / 2];
    
    tagLabelOriginX += size.width + TagCapWidth * 2 + MarginBetweenTags;
  }
}

@end
