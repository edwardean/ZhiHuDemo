//
//  ZHListViewController.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZHListView/ZHModel.h>

@class ZHModel;
@class ZHListViewDataSource;
@class ZHListViewDelegate;
@class ZHListView;

@interface ZHListViewController : UIViewController

@property (nonatomic, strong) ZHListView *listView;
@property (nonatomic, strong) ZHListViewDelegate *listViewDelegate;
@property (nonatomic, strong) ZHListViewDataSource *listViewDataSource;
@property (nonatomic, strong) ZHModel *model;

- (void)loadListView;

- (void)registerCellClass:(Class)cellClass;

- (void)createListViewDelegate;

- (void)createListViewDataSource;

- (void)modelDidFinishLoading:(id<ZHModel>)model;

@end
