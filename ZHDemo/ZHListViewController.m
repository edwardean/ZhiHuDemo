//
//  ZHListViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHListViewController.h"
#import "ZHListView.h"
#import "ZHListViewDataSource.h"
#import "ZHListViewDelegate.h"

@interface ZHListViewController ()

@end

@implementation ZHListViewController

@synthesize listView = listView_;
@synthesize listViewDelegate = listViewDelegate_;
@synthesize listViewDataSource = listViewDataSource_;
@synthesize model = model_;

#pragma mark - View Life Cycle

- (void)loadView
{
	self.view = self.listView;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (ZHListView *)listView
{
	if (!listView_) {
    [self loadListView];
    self.listView.delegate = self.listViewDelegate;
    self.listView.dataSource = self.listViewDataSource;
  }
  return listView_;
}

- (void)loadListView
{
	self.listView = [[ZHListView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)registerCellClass:(Class)cellClass
{
	[self.listViewDelegate setListCellClass:cellClass];
  [self.listViewDataSource setListCellClass:cellClass];
}

#pragma mark - Delegate And DataSource

- (ZHListViewDelegate *)listViewDelegate
{
	if (listViewDelegate_) {
    return listViewDelegate_;
  } else {
  	[self createListViewDelegate];
  }
	return listViewDelegate_;
}

- (void)setListViewDelegate:(ZHListViewDelegate *)listViewDelegate
{
	if (listViewDelegate != listViewDelegate_) {
    listViewDelegate_ = listViewDelegate;
    if ([self isViewLoaded]) {
      [self.listView setDelegate:listViewDelegate_];
    }
  }
}

- (ZHListViewDataSource *)listViewDataSource
{
	if (listViewDataSource_) {
    return listViewDataSource_;
  } else {
  	[self createListViewDataSource];
  }
  return listViewDataSource_;
}

- (void)setListViewDataSource:(ZHListViewDataSource *)listViewDataSource
{
	if (listViewDataSource != listViewDataSource_) {
    listViewDataSource_ = listViewDataSource;
    if ([self isViewLoaded]) {
      [self.listView setDataSource:listViewDataSource_];
    }
  }
}

- (void)createListViewDelegate
{
	ZHListViewDelegate *delegate = [[ZHListViewDelegate alloc] init];
  self.listViewDelegate = delegate;
}

- (void)createListViewDataSource
{
	ZHListViewDataSource *dataSource = [[ZHListViewDataSource alloc] init];
  self.listViewDataSource = dataSource;
}

#pragma mark - DataBind

- (void)modelDidFinishLoading:(id<ZHModel>)model
{
	if (![model isKindOfClass:[ZHModel class]]) {
    return;
  }
  
  ZHModel *mo = (ZHModel *)model;
  self.model = mo;
	NSArray *dataArray = [mo objects];
  [self.listViewDelegate setObjects:dataArray];
  [self.listViewDataSource setObjects:dataArray];
  [self.listView reloadData];
}

- (void)numberOfSectionForListView:(NSInteger)sections
{
	if (listViewDataSource_) {
    self.listViewDataSource.sections = sections;
  }
}

#pragma mark - Memory Manage

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];

}

@end
