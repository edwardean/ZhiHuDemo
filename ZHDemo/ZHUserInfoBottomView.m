//
//  ZHUserInfoBottomView.m
//  ZHDemo
//
//  Created by Edward on 13-7-16.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserInfoBottomView.h"

#define ButtonToLabelMargin										8
#define LabelToButtonMargin										10

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
        [voteupButton_ setImage:[UIImage imageNamed:@"ZHFeaturedIconRate.png"]
                       forState:UIControlStateNormal];
        [voteupButton_ setX:15.0f];
        [voteupButton_ setCenterY:self.contentCenter.y];
        [self addSubview:voteupButton_];
      }
      
      if (!voteupLabel_) {
        self.voteupLabel = [[UILabel alloc] init];
        [voteupLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [voteupLabel_ setText:@"0"];
        [voteupLabel_ setCenterY:self.contentCenter.y];
        [self addSubview:voteupLabel_];
      }
      
      if (!thankedButton_) {
        self.thankedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [thankedButton_ setSize:CGSizeMake(20, 19)];
        [thankedButton_ setImage:[UIImage imageNamed:@"ZHAnswerViewThankIconNormal.png"] forState:UIControlStateNormal];
        [thankedButton_ setX:100];
        [thankedButton_ setCenterY:self.contentCenter.y];
        [self addSubview:thankedButton_];
      }
      
      if (!thankedLabel_) {
        self.thankedLabel = [[UILabel alloc] init];
        [thankedLabel_ setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [thankedLabel_ setText:@"0"];
        [thankedLabel_ setX:100 + ButtonToLabelMargin];
        [thankedLabel_ setCenterY:self.contentCenter.y];
        [self addSubview:thankedLabel_];
      }
      
      
    }
    return self;
}


- (void)layoutSubviews
{
	[super layoutSubviews];
  
  
}

@end
