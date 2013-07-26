//
//  ZHQuestionMessageView.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionMessageView.h"

@interface ZHQuestionMessageView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, assign) CGSize maxSize;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *messageFont;

@end

@implementation ZHQuestionMessageView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {

  }
  return self;
}


@end
