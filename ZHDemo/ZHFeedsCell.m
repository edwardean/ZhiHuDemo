//
//  ZHFeedsCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsCell.h"

@interface ZHFeedsCell ()

@property (nonatomic, strong, readwrite) UILabel *actorsLabel;							//某某某
@property (nonatomic, strong, readwrite) UILabel *feedLabel;								//回答/赞同了该问题
@property (nonatomic, strong, readwrite) UIImageView *avatarImageView;	    //头像
@property (nonatomic, strong, readwrite) UILabel *titleLabel;								//标题
@property (nonatomic, strong, readwrite) UIImageView *voteupBackgroundView;	//标签背景
@property (nonatomic, strong, readwrite) UILabel *voteupLabel;							//标签
@property (nonatomic, strong, readwrite) UILabel *answerExcerptLabel;				//问题描述

@end

@implementation ZHFeedsCell
@synthesize actorsLabel = actorsLabel_;
@synthesize feedLabel = feedLabel_;
@synthesize avatarImageView = avatarImageView_;
@synthesize titleLabel = titleLabel_;
@synthesize voteupBackgroundView = voteupBackgroundView_;
@synthesize voteupLabel = voteupLabel_;
@synthesize answerExcerptLabel = answerExcerptLabel_;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    
  }
  return self;
}

+ (CGFloat)RowHeightWitObject:(id)object
{
	return 144.0f;
}

- (void)bindWithObject:(id)object
{

}

@end
