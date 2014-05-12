//
//  ZHCheckBox.m
//  ZHCheckBox
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCheckBox.h"

typedef enum
{
  ZHCheckBoxTypeDefault = 0,			//Only Title
  ZHCheckBoxTypeImage,						//Only Image
  ZHCheckBoxTypeTitleAndImage,		//Image and Title
  ZHCheckBoxTypePlain							//Nothing, Only Background
} ZHCheckBoxType;

@interface ZHCheckBox ()

@property (nonatomic, strong) UIImageView *checkBoxImageView;
@property (nonatomic, strong) UIImageView *smallImgView;

@property (nonatomic, strong) UIImage *unselectedNormalBgImage;
@property (nonatomic, strong) UIImage *unselectedselectedBgImage;
@property (nonatomic, strong) UIImage *selectedNormalBgImage;
@property (nonatomic, strong) UIImage *selectedselectedBgImage;

@property (nonatomic, strong) UILabel *checkBoxTitleLabel;

@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *selectedTitle;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, assign) ZHCheckBoxType BoxType;
@property (nonatomic, assign) CGSize titleSize;

- (void)setUp;
- (void)handleTouchEvent;
- (void)updateCheckbox:(BOOL)checked;

@end

@implementation ZHCheckBox

@synthesize normalTitle = normalTitle_;
@synthesize selectedTitle = selectedTitle_;
@synthesize normalImage = normalImage_;
@synthesize selectedImage = selectedImage_;

@synthesize checkBoxImageView = checkBoxImageView_;
@synthesize smallImgView = smallImgView_;
@synthesize unselectedNormalBgImage = unselectedNormalImage_;
@synthesize unselectedselectedBgImage = unselectedselectedImage_;
@synthesize selectedNormalBgImage = selectedNormalImage_;
@synthesize selectedselectedBgImage = selectedselectedImage_;
@synthesize checkBoxTitleLabel = checkBoxTitleLabel_;

@synthesize BoxType = BoxType_;
@synthesize titleSize = titleSize_;

+ (id)checkBoxWithSize:(CGSize)size
           NormalTitle:(NSString *)normalTitle
         SelectedTitle:(NSString *)selectedTitle
unselectedNormalBgImage:(UIImage *)unselectedImage
unselectedHighlightImage:(UIImage *)unselectedHighlightImage
 selectedNormalBgImage:(UIImage *)selectedNormalBgImage
selectedHighlightImage:(UIImage *)selectedHighlightImage
{
	ZHCheckBox *checkBox = [[ZHCheckBox alloc]
                          initWithFrame:CGRectMake(0,
                                                   0,
                                                   size.width,
                                                   size.height)];
  checkBox.normalTitle = normalTitle;
  checkBox.selectedTitle = selectedTitle;
  checkBox.unselectedNormalBgImage = unselectedImage;
  checkBox.unselectedselectedBgImage = unselectedHighlightImage;
  checkBox.selectedNormalBgImage = selectedNormalBgImage;
  checkBox.selectedselectedBgImage = selectedHighlightImage;
  
  checkBox.checkBoxImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
  [checkBox.checkBoxImageView setAutoresizesSubviews:YES];
  [checkBox.checkBoxImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
  
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
  
  [self.checkBoxImageView setImage:self.unselectedNormalBgImage];
  [self.checkBoxTitleLabel setFrame:self.checkBoxImageView.bounds];
  [self.checkBoxTitleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
  [self.checkBoxTitleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.checkBoxTitleLabel setTextColor:[UIColor whiteColor]];
  [self.checkBoxImageView addSubview:self.checkBoxTitleLabel];
  self.bounds = self.checkBoxImageView.bounds;
  
  [self addTarget:self action:@selector(handleTouchEvent)
 forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.checkBoxImageView];
}

+ (id)checkBoxWithNormalTitle:(NSString *)normalTitle
                SelectedTitle:(NSString *)selectedTitle
                     NorImage:(UIImage *)norImage
                SelectedImage:(UIImage *)selectedImage
        unselectedNormalBgImg:(UIImage *)unselectedBgImg
     unselectedHighlightBgImg:(UIImage *)unselectedHighlightBgImg
          selectedNormalBgImg:(UIImage *)selectedNormalBgImg
       selectedHighlightBgImg:(UIImage *)selectedHighlightBgImg
{
  ZHCheckBox *checkButton = [[ZHCheckBox alloc] initWithFrame:CGRectZero];
  checkButton.normalTitle = normalTitle;
  checkButton.selectedTitle = selectedTitle;
  checkButton.normalImage = norImage;
  checkButton.selectedImage = selectedImage;
  checkButton.unselectedNormalBgImage = unselectedBgImg;
  checkButton.unselectedselectedBgImage = unselectedHighlightBgImg;
  checkButton.selectedNormalBgImage = selectedNormalBgImg;
  checkButton.selectedselectedBgImage = selectedHighlightBgImg;
  
  checkButton.checkBoxImageView = [[UIImageView alloc] init];
  [checkButton.checkBoxImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
  [checkButton.checkBoxImageView setAutoresizesSubviews:YES];
  
  
	return nil;
}


- (void)setAppearance
{
  self.backgroundColor = [UIColor clearColor];
  
  self.BoxType = -1;
  
  self.checkBoxTitleLabel = [[UILabel alloc] init];
  [self.checkBoxTitleLabel setBackgroundColor:[UIColor clearColor]];
  [self.checkBoxTitleLabel setShadowColor:[UIColor grayColor]];
  [self.checkBoxTitleLabel setAdjustsFontSizeToFitWidth:YES];
  [self.checkBoxTitleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
  [self.checkBoxTitleLabel setTextAlignment:NSTextAlignmentCenter];
  [self.checkBoxTitleLabel setNumberOfLines:1];
  [self.checkBoxTitleLabel setTextColor:[UIColor whiteColor]];
  //[self.checkBoxImageView addSubview:self.checkBoxTitleLabel];
  [self addSubview:self.checkBoxImageView];
  
  self.smallImgView = [[UIImageView alloc] init];
  //[self.checkBoxImageView addSubview:self.smallImgView];
  self.titleSize = CGSizeZero;
  
	if (self.normalTitle || self.selectedTitle) {
   self.titleSize = [self.normalTitle length] > [self.selectedTitle length] ?
    [self.normalTitle sizeWithFont:self.checkBoxTitleLabel.font] : [self.selectedTitle sizeWithFont:self.checkBoxTitleLabel.font];
    if (self.normalImage) {
      [self.smallImgView setImage:self.normalImage];
      self.BoxType = ZHCheckBoxTypeTitleAndImage;
    } else {
    	self.BoxType = ZHCheckBoxTypeDefault;
    }
  } else {
    if (self.normalImage) {
      [self.smallImgView setImage:self.normalImage];
      self.BoxType = ZHCheckBoxTypeImage;
    } else {
    	self.BoxType = ZHCheckBoxTypePlain;
    }
  }
  
  if (!self.unselectedselectedBgImage) {
    self.unselectedselectedBgImage = self.unselectedNormalBgImage;
  }
  
  if (!self.selectedselectedBgImage) {
    self.selectedselectedBgImage = self.selectedNormalBgImage;
  }
  
  [self checkBoxStye:self.BoxType];
  
  [self setNeedsLayout];
}

- (void)checkBoxStye:(ZHCheckBoxType)type
{
  CGSize titleImageSize = CGSizeMake(17, 14);
  CGRect titleRect = CGRectMake(0,0,self.titleSize.width,self.titleSize.height);
  CGRect frame = CGRectInset(titleRect, -10, -5);
	switch (type) {
    case ZHCheckBoxTypeDefault:
      
      [self.checkBoxImageView setFrame:frame];
      [self.checkBoxTitleLabel setText:self.normalTitle];
      [self.checkBoxTitleLabel setSize:self.titleSize];
      [self.checkBoxImageView addSubview:self.checkBoxTitleLabel];
      
      break;
    case ZHCheckBoxTypeImage:
      [self.smallImgView setSize:titleImageSize];
      [self.checkBoxImageView setFrame:CGRectInset(self.smallImgView.bounds, -10, -5)];
      [self.checkBoxImageView addSubview:self.smallImgView];
      
      break;
    case ZHCheckBoxTypeTitleAndImage:
      
      break;
    case ZHCheckBoxTypePlain:
      
      break;
    default:
      break;
  }
  
  self.bounds = self.checkBoxImageView.bounds;
}

- (void)setHighlighted:(BOOL)highlighted
{
	if (highlighted) {
    if (self.selected) {
      [self.checkBoxImageView setImage:self.selectedselectedBgImage];
    } else {
    	[self.checkBoxImageView setImage:self.unselectedselectedBgImage];
    }
  } else {
  	if (self.isSelected) {
      [self.checkBoxImageView setImage:self.selectedNormalBgImage];
    } else {
    	[self.checkBoxImageView setImage:self.unselectedNormalBgImage];
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
    [self.checkBoxTitleLabel setShadowOffset:CGSizeZero];
    [self.checkBoxTitleLabel setText:self.selectedTitle];
    [self.checkBoxTitleLabel setTextColor:[UIColor grayColor]];
    [self.checkBoxImageView setImage:self.selectedNormalBgImage];
  } else {
    [self.checkBoxTitleLabel setShadowOffset:CGSizeMake(0, -1)];
    [self.checkBoxTitleLabel setText:self.normalTitle];
    [self.checkBoxTitleLabel setTextColor:[UIColor whiteColor]];
  	[self.checkBoxImageView setImage:self.unselectedNormalBgImage];
  }
  
  if ([self.delegate respondsToSelector:@selector(checkbox:didChangeState:)]) {
    [self.delegate checkbox:self didChangeState:checked];
  }
  
}

@end
