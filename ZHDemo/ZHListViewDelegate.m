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
@synthesize cellHeaderView = cellHeaderView_;
@synthesize cellFooterView = cellFooterView_;
@synthesize listCellClass = listCellClass_;
@synthesize cellBackgroundImage = cellBackgroundImage_;

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

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (cellBackgroundImage_) {
    //cell.backgroundView = nil;
    UIImageView *cellBackView = [[UIImageView alloc] init];
    [cellBackView setImage:cellBackgroundImage_];
    cellBackView.clipsToBounds = YES;
    [cell setBackgroundView:/*[[UIImageView alloc] initWithImage:cellBackgroundImage_]*/cellBackView];
  }
}

@end
