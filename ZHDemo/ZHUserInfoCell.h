//
//  ZHUserInfoCell.h
//  ZHDemo
//
//  Created by Edward on 13-7-19.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHUserInfoCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *countLabel;

- (void)setCellTitle:(NSString *)title
         CountString:(NSString *)count
     isTitleInCenter:(BOOL)isCenter;

@end
