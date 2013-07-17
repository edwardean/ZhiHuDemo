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

@synthesize sections = sections_;
@synthesize listCellClass = listCellClass_;
@synthesize listViewCellClassIdentifier = listViewCellClassIdentifier_;

- (NSInteger)sections
{
	if (!sections_) {
    return 1;
  } else {
  	return sections_;
  }
}

- (void)setSections:(NSInteger)sections
{
	if (!sections) {
    sections_ = 1;
    return;
  }
	sections_ = sections;
}

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
  return self.sections;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return 1;
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
