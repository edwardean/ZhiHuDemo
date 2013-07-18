//
//  ZHAnswerCheckBox.m
//  ZHAnswerCheckBox
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAnswerCheckBox.h"

@interface ZHAnswerCheckBox ()

@property (nonatomic, strong) UIImageView *checkBoxImageView;

@property (nonatomic, strong) UIImage *unselectedNormalImage;
@property (nonatomic, strong) UIImage *unselectedHighlightImage;
@property (nonatomic, strong) UIImage *selectedNormalImage;
@property (nonatomic, strong) UIImage *selectedHighlightImage;

@property (nonatomic, strong) UILabel *checkBoxTitleLabel;

@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *selectedTitle;

- (void)setUp;
- (void)handleTouchEvent;
- (void)updateCheckbox:(BOOL)checked;

@end

@implementation ZHAnswerCheckBox

@synthesize normalTitle = normalTitle_;
@synthesize selectedTitle = selectedTitle_;

@synthesize checkBoxImageView = checkBoxImageView_;
@synthesize unselectedNormalImage = unselectedNormalImage_;
@synthesize unselectedHighlightImage = unselectedHighlightImage_;
@synthesize selectedNormalImage = selectedNormalImage_;
@synthesize selectedHighlightImage = selectedHighlightImage_;
@synthesize checkBoxTitleLabel = checkBoxTitleLabel_;

+ (id)checkBoxNormalTitle:(NSString *)normalTitle
            SelectedTitle:(NSString *)selectedTitle
{
  ZHAnswerCheckBox *checkBox = [[ZHAnswerCheckBox alloc] initWithFrame:CGRectZero];
  checkBox.normalTitle = normalTitle;
  checkBox.selectedTitle = selectedTitle;
  [checkBox setUp];
  return checkBox;
}

- (void)setUp
{
  self.backgroundColor = [UIColor clearColor];
  
  self.checkBoxTitleLabel = [[UILabel alloc] init];
  [self.checkBoxTitleLabel setText:self.normalTitle];
  [self.checkBoxTitleLabel setBackgroundColor:[UIColor clearColor]];
  [self.checkBoxTitleLabel setShadowColor:[UIColor grayColor]];
  [self.checkBoxTitleLabel setAdjustsFontSizeToFitWidth:YES];
  
	self.unselectedNormalImage = [UIImage imageNamed:@"ZHFollowButtonNormal.png"];
  self.unselectedHighlightImage = [UIImage imageNamed:@"ZHFollowButtonHighlight.png"];
  self.selectedNormalImage = [UIImage imageNamed:@"ZHGuidePushButtonNormal.png"];
  self.selectedHighlightImage = [UIImage imageNamed:@"ZHGuidePushButtonHighlight.png"];
  
  self.checkBoxImageView = [[UIImageView alloc] initWithImage:self.unselectedNormalImage];
  [self.checkBoxImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
  [self.checkBoxTitleLabel setFrame:self.checkBoxImageView.bounds];
  [self.checkBoxTitleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
  [self.checkBoxTitleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.checkBoxTitleLabel setTextColor:[UIColor whiteColor]];
  [self.checkBoxImageView addSubview:self.checkBoxTitleLabel];
  self.bounds = self.checkBoxImageView.bounds;
  
  [self addTarget:self action:@selector(handleTouchEvent) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.checkBoxImageView];
}

- (void)setHighlighted:(BOOL)highlighted
{
	if (highlighted) {
    if (self.selected) {
      [self.checkBoxImageView setImage:self.selectedHighlightImage];
    } else {
    	[self.checkBoxImageView setImage:self.unselectedHighlightImage];
    }
  } else {
  	if (self.isSelected) {
      [self.checkBoxImageView setImage:self.selectedNormalImage];
    } else {
    	[self.checkBoxImageView setImage:self.unselectedNormalImage];
    }
  }
}

- (void)handleTouchEvent
{
  
	self.selected = !self.selected;
  
  [self updateCheckbox:self.isSelected];
}

- (void)updateCheckbox:(BOOL)checked
{
	if (checked) {
    [self.checkBoxTitleLabel setShadowOffset:CGSizeMake(0, 0)];
    [self.checkBoxTitleLabel setText:self.selectedTitle];
    [self.checkBoxTitleLabel setTextColor:[UIColor grayColor]];
    [self.checkBoxImageView setImage:self.selectedNormalImage];
  } else {
    
    [self.checkBoxTitleLabel setShadowOffset:CGSizeMake(0, -1)];
    [self.checkBoxTitleLabel setText:self.normalTitle];
    [self.checkBoxTitleLabel setTextColor:[UIColor whiteColor]];
  	[self.checkBoxImageView setImage:self.unselectedNormalImage];
  }
  
  if ([self.delegate respondsToSelector:@selector(checkbox:didChangeState:)]) {
    [self.delegate checkbox:self didChangeState:checked];
  }

}

@end
