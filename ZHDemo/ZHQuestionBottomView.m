//
//  ZHQuestionBottomView.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionBottomView.h"
#import "ZHCheckBox.h"

#define FootherViewHeigh	44
#define MarginToLeftSide	10
#define MarginToRightSide	10
#define FansButtonToFansLabelMargin	5
#define FansLabelTocommentButtonMargin	10
#define commentButtonTocommentLabelMargin	5

#define imageSizeWidth	17
#define imageSizeHeigh	15

@interface ZHQuestionBottomView ()

@property (nonatomic, strong) UIButton *fansButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UILabel *fansLabel;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) ZHCheckBox *followButton;

@end

@implementation ZHQuestionBottomView
@synthesize fansButton = fansButton_;
@synthesize commentButton = commentButton_;
@synthesize fansLabel = fansLabel_;
@synthesize commentLabel = commentLabel_;
@synthesize followButton = followButton_;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  if (self) {
    
    self.fansButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fansButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewFollowingIcon@2x.png"]
                 forState:UIControlStateNormal];
    [fansButton_ setFrame:CGRectMake(MarginToLeftSide, self.frame.size.height/2,
                                     imageSizeWidth, imageSizeHeigh)];
    [fansButton_ setCenterY:self.centerY];
    [self addSubview:fansButton_];
    
    self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commentButton_ setImage:[UIImage imageNamed:@"ZHQuestionViewCommentIcon@2x.png"]
                    forState:UIControlStateNormal];
    [self addSubview:commentButton_];
    
    self.fansLabel = [[UILabel alloc] init];
    [fansLabel_ setBackgroundColor:[UIColor clearColor]];
    [fansLabel_ setTextColor:[UIColor colorWithWhite:0.510 alpha:1.000]];
    [fansLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [self addSubview:fansLabel_];
    
    self.commentLabel = [[UILabel alloc] init];
    [commentLabel_ setBackgroundColor:[UIColor clearColor]];
    [commentLabel_ setTextColor:[UIColor colorWithWhite:0.510 alpha:1.000]];
    [commentLabel_ setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [self addSubview:commentLabel_];
    
    [self prepareForUse];
  }
  return self;
}

- (void)prepareForUse
{
	[self.fansLabel setText:@"0"];
  [self.commentLabel setText:@"0"];
}

- (void)setFansCount:(NSString *)fansCount
       commentsCount:(NSString *)commentsCount
{
	[self prepareForUse];
  
  [self.fansLabel setText:fansCount];
  [self.commentLabel setText:commentsCount];
  
  [self setNeedsLayout];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [fansLabel_ sizeToFit];

  CGFloat fansLabelOriginX = [fansButton_ right] + FansButtonToFansLabelMargin;
  [fansLabel_ setX:fansLabelOriginX];
  
  [fansLabel_ setCenterY:[self height]/2];
  
  
	CGFloat commentButtonOriginX = fansLabelOriginX + fansLabel_.frame.size.width +
	FansLabelTocommentButtonMargin;
  [commentButton_ setFrame:CGRectMake(commentButtonOriginX,
																			 0,
																			 imageSizeWidth,
                                       imageSizeHeigh)];
	CGPoint commentButtonCenter = commentButton_.center;
	commentButtonCenter.y = self.frame.size.height / 2;
	[commentButton_ setCenter:commentButtonCenter];
	
	
	CGFloat commemtsLabelOriginX = commentButtonOriginX + commentButton_.bounds.size.width +
	commentButtonTocommentLabelMargin;
  [commentLabel_ sizeToFit];
	[commentLabel_ setFrame:CGRectMake(commemtsLabelOriginX,
																			self.frame.size.height / 2,
																			self.commentLabel.frame.size.width,
                                      self.commentLabel.frame.size.height)];
	CGPoint commentLabelCenter = commentLabel_.center;
	commentLabelCenter.y = self.frame.size.height / 2;
	[commentLabel_ setCenter:commentLabelCenter];

}

@end
