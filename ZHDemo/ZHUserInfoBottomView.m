//
//  ZHUserInfoBottomView.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoBottomView.h"

#define ZHUSERINFOBUTTONTOLABELMARGIN										5
#define ZHUSERINFOLABELTOBUTTONMARGIN										8

@interface ZHUserInfoBottomView ()

@property (nonatomic) UIButton *voteupButton;						  //赞
@property (nonatomic) UILabel *voteupLabel;
@property (nonatomic) UIButton *thankedButton;						//喜欢
@property (nonatomic) UILabel *thankedLabel;
@property (nonatomic) UIButton *privateletterButton;			//私信按钮
@property (nonatomic) UIButton *followButton;							//关注按钮

@property (nonatomic, assign) CGPoint contentCenter;

@end

@implementation ZHUserInfoBottomView

@synthesize voteupButton = voteupButton_;
@synthesize voteupLabel = voteupLabel_;
@synthesize thankedButton = thankedButton_;
@synthesize thankedLabel = thankedLabel_;
@synthesize privateletterButton = privateletterButton_;
@synthesize followButton = followButton_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
			
      self.contentCenter = self.center;
      
      if (!voteupButton_) {
        self.voteupButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [voteupButton_ setSize:CGSizeMake(20, 19)];
        [voteupButton_ setImage:[UIImage imageNamed:@"ZHVoteupIcon.png"]
                       forState:UIControlStateNormal];
        [voteupButton_ setX:8.0f];
        [voteupButton_ setCenterY:self.contentCenter.y];
        [self addSubview:voteupButton_];
      }
      
      if (!voteupLabel_) {
        self.voteupLabel = [[UILabel alloc] init];
        [voteupLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [voteupLabel_ setBackgroundColor:[UIColor clearColor]];
        [voteupLabel_ setCenterY:self.contentCenter.y];
        [self addSubview:voteupLabel_];
      }
      
      if (!thankedButton_) {
        self.thankedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [thankedButton_ setSize:CGSizeMake(20, 19)];
        [thankedButton_ setImage:[UIImage imageNamed:@"ZHThankIcon.png"] forState:UIControlStateNormal];
        [thankedButton_ setX:70];
        [thankedButton_ setCenterY:self.contentCenter.y];
        [self addSubview:thankedButton_];
      }
      
      if (!thankedLabel_) {
        self.thankedLabel = [[UILabel alloc] init];
        [thankedLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [thankedLabel_ setBackgroundColor:[UIColor clearColor]];
        [thankedLabel_ setAdjustsFontSizeToFitWidth:YES];
        [thankedLabel_ setX:70 + ZHUSERINFOBUTTONTOLABELMARGIN];
        [thankedLabel_ setCenterY:self.contentCenter.y];
        [self addSubview:thankedLabel_];
      }
      
			if (!privateletterButton_) {
        self.privateletterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.privateletterButton setSize:CGSizeMake(52, 31)];
        [privateletterButton_ setCenterY:self.contentCenter.y];
        [self.privateletterButton setImage:[UIImage imageNamed:@"ZHRegisterButton3Highlight.png"] forState:UIControlStateHighlighted];
        [self.privateletterButton setImage:[UIImage imageNamed:@"ZHRegisterButton3Normal.png"] forState:UIControlStateNormal];
        [privateletterButton_ setX:120];
        [self.privateletterButton addTarget:self action:@selector(button1Tapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:privateletterButton_];
      }
      
      [self clearBottomViewContent];
    }
    return self;
}

- (void)button1Tapped
{
	NSLog(@"%s",__func__);
}

- (void)clearBottomViewContent
{
	[self.voteupLabel setText:@"0"];
  [self.thankedLabel setText:@"0"];
}

- (void)addUserVoteupCount:(NSString *)voteup ThankCount:(NSString *)thankCount
{
	[self clearBottomViewContent];
  
  [self.voteupLabel setText:voteup];
  [self.thankedLabel setText:thankCount];
  
  [self.voteupLabel sizeToFit];
  [self.thankedLabel sizeToFit];
  
  [self setNeedsLayout];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
  
  [self.voteupLabel setX:[self.voteupButton right] + ZHUSERINFOBUTTONTOLABELMARGIN];
  [self.voteupLabel setCenterY:[self.voteupButton centerY]];
  
  [self.thankedButton setX:[self.voteupLabel right] + ZHUSERINFOLABELTOBUTTONMARGIN];
  
  [self.thankedLabel setX:[self.thankedButton right] + ZHUSERINFOBUTTONTOLABELMARGIN];
  [self.thankedLabel setCenterY:[self.voteupButton centerY]];
}

@end
