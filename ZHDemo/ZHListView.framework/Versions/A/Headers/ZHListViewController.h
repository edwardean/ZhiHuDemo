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

@property (nonatomic, strong) ZHListView *listView;											//默认tableview
@property (nonatomic, strong) ZHListViewDelegate *listViewDelegate;			//代理对象
@property (nonatomic, strong) ZHListViewDataSource *listViewDataSource;	//数据源对象
@property (nonatomic, strong) ZHModel *model;														//数据模型对象

/**
 * [可选方法，构造tableview，与UIViewController的loadView方法相似]
 **/
- (void)loadListView;								

/**
 * [向控制器注册UITableViewCell类，子类必须实现该方法，否则显示默认的cell]
 * @param cellClass [子类cell的类]
 **/
- (void)registerCellClass:(Class)cellClass;

/**
 * [可选方法，创建委托对象。若不实现由基类的委托对象担任]
 **/
- (void)createListViewDelegate;

/**
 * [可选方法，创建数据源对象。若不实现由基类的数据源对象担任]
 **/
- (void)createListViewDataSource;

/**
 * [将数据模型与控制器绑定并自动刷新tableView]
 * @param model [数据模型对象]
 **/
- (void)modelDidFinishLoading:(id<ZHModel>)model;

@end
