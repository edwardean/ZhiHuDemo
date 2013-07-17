//
//  ZHListViewDataSource.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHListViewDataSource.h"
#import "ZHCollectionCell.h"

@interface ZHListViewDataSource ()

@property (nonatomic) NSString *listViewCellClassIdentifier;

@end

@implementation ZHListViewDataSource

@synthesize listCellClass = listCellClass_;
@synthesize listViewCellClassIdentifier = listViewCellClassIdentifier_;

- (void)setListCellClass:(Class)listCellClass
{
	NSAssert([listCellClass isSubclassOfClass:[ZHListViewCell class]],
           @"The Class member must be Subclassing of 'ZHListCell'");
  if (listCellClass != listCellClass_) {
    listCellClass_ = listCellClass;
  }
  self.listViewCellClassIdentifier = NSStringFromClass(listCellClass_);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ZHListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                          self.listViewCellClassIdentifier];
  
  if (!cell) {
    cell = [[self.listCellClass alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:listViewCellClassIdentifier_];
  }
  
  if (indexPath.row > [self.objects count] - 1) {
    cell.hidden = YES;
  } else {
  	//填充cell数据
    [cell bindWithObject:[self.objects objectAtIndex:indexPath.section]];
  }
  
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.clipsToBounds = YES;
  
  return cell;
}

@end
