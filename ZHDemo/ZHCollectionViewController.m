//
//  ZHCollectionViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionViewController.h"
#import "ZHCollectionCell.h"
#import "ZHCollectionDelegate.h"
#import "ZHCollectionDataSource.h"
#import "ZHParser.h"
#import "ZHCollectionFactory.h"

@interface ZHCollectionViewController ()

@end

@implementation ZHCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  
  [self registerCellClass:[ZHCollectionCell class]];
	
  ZHParser *parser = [ZHCollectionFactory ParserFactory];
  
  ZHModel *model = [parser parser];
  NSLog(@"Model,Object:%@",model.object);
  NSLog(@"Model,Objects:%@",model.objects);
  [self numberOfSectionForListView:model.objects.count];
  [self modelDidFinishLoading:model];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  
}

//- (void)createListViewDelegate
//{
//	ZHCollectionDelegate *delegate = [[ZHCollectionDelegate alloc] init];
//  self.listViewDelegate = delegate;
//}

//- (void)createListViewDataSource
//{
//	ZHCollectionDataSource *dataSource = [[ZHCollectionDataSource alloc] init];
//  self.listViewDataSource = dataSource;
//}

//- (void)modelDidFinishLoading:(id<ZHModel>)model
//{
//	
//}

@end
