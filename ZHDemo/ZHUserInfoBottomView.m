//
//  ZHUserInfoBottomView.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoBottomView.h"
#import "ZHCheckBox.h"

#define ZHUSERINFOBUTTONTOLABELMARGIN										3
#define ZHUSERINFOLABELTOBUTTONMARGIN										8

@interface ZHUserInfoBottomView ()

@property (nonatomic) UIButton *voteupButton;						  //赞
@property (nonatomic) UILabel *voteupLabel;
@property (nonatomic) UIButton *thankedButton;						//喜欢
@property (nonatomic) UILabel *thankedLabel;
@property (nonatomic) ZHCheckBox *privateletterButton;			//私信按钮
@property (nonatomic) ZHCheckBox *followButton;							//关注按钮


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
      UIImage *normalImage = [UIImage imageNamed:@"ZHRegisterButton3Normal.png"];
      UIImage *highlightImage = [UIImage imageNamed:@"ZHRegisterButton3Highlight.png"];
      self.privateletterButton = [ZHCheckBox checkBoxWithSize:CGSizeMake(52, 31)
                                                  NormalTitle:nil
                                                SelectedTitle:nil
                                        unselectedNormalImage:normalImage
                                     unselectedHighlightImage:highlightImage
                                          selectedNormalImage:normalImage
                                       selectedHighlightImage:highlightImage];
      
      UIImage *messageImage = [UIImage imageNamed:@"ZHProfileMessageIconNormal.png"];
      UIImageView *messageView = [[UIImageView alloc] initWithImage:messageImage];
      [privateletterButton_ addSubview:messageView];
      [messageView setCenter:self.privateletterButton.center];
      
      [self addSubview:privateletterButton_];
    }
    
    if (!followButton_) {
      UIImage *unselectedNormalImage = [UIImage imageNamed:@"ZHFollowButtonNormal.png"];
      UIImage *unselectedHighlightImage = [UIImage imageNamed:@"ZHFollowButtonHighlight.png"];
      UIImage *selectedNormalImage = [UIImage imageNamed:@"ZHGuidePushButtonNormal.png"];
      UIImage *selectedHighlightImage = [UIImage imageNamed:@"ZHGuidePushButtonHighlight.png"];
      
      self.followButton = [ZHCheckBox checkBoxWithSize:CGSizeMake(76, 31)
                                           NormalTitle:@"关注"
                                         SelectedTitle:@"取消关注"
                                 unselectedNormalImage:unselectedNormalImage
                              unselectedHighlightImage:unselectedHighlightImage
                                   selectedNormalImage:selectedNormalImage
                                selectedHighlightImage:selectedHighlightImage];
      
      [self addSubview:followButton_];
    }
    
    [self clearBottomViewContent];
  }
  return self;
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
  
  
  [self.privateletterButton setX:173];
  [self.privateletterButton setCenterY:[self.voteupButton centerY]];
  
  [self.followButton setX:235];
  [self.followButton setCenterY:[self.voteupButton centerY]];
}

@end
