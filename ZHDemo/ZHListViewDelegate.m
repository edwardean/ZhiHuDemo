//
//  ZHListViewDelegate.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHListViewDelegate.h"

@implementation ZHListViewDelegate

- (CGFloat)tableView:(UITableView *)tableView
		heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.0f;
}

- (void)tableView:(UITableView *)tableView
		didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}

@end
