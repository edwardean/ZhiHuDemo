//
//  ZHFeedsCell.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsCell.h"

@implementation ZHFeedsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.backgroundView = [[UIImageView alloc]
                           initWithImage:[[UIImage
                              imageNamed:@"ZHExploreListItemBase.png"]
             resizableImageWithCapInsets:UIEdgeInsetsMake(15, 16, 7, 16)]];
  }
  return self;
}

@end
