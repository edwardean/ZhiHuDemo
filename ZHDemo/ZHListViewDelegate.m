//
//  ZHListViewDelegate.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHListViewDelegate.h"

@implementation ZHListViewDelegate

@synthesize cellHeaderView = cellHeaderView_;
@synthesize cellFooterView = cellFooterView_;

- (CGFloat)tableView:(UITableView *)tableView
		heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0f;
}

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}

- (UIView *)tableView:(UITableView *)tableView
		viewForHeaderInSection:(NSInteger)section
{
	return cellHeaderView_;
}

- (UIView *)tableView:(UITableView *)tableView
		viewForFooterInSection:(NSInteger)section
{
	return cellFooterView_;
}

@end
