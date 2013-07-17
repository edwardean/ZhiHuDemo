//
//  ZHListViewDelegate.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHListViewDelegate.h"
#import "ZHListViewCell.h"

@implementation ZHListViewDelegate

@synthesize objects = objects_;

@synthesize listCellClass = listCellClass_;

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  id object = [self.objects objectAtIndex:indexPath.section];
  return [self.listCellClass RowHeightWitObject:object];
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
	return 0.0f;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}

@end
