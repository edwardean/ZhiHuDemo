//
//  ZHCollectionViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionCell.h"
#import <ZHListView/ZHListViewDelegate.h>
#import "ZHParser.h"
#import "ZHCollectionFactory.h"
#import "ZHCollectionViewController.h"

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
  
  self.listView.contentOffset = CGPointMake(0, -10);
  
  [self registerCellClass:[ZHCollectionCell class]];
	
  ZHParser *parser = [ZHCollectionFactory ParserFactory];
  
  ZHModel *model = [parser parser];
  
  [self modelDidFinishLoading:model];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  
}

@end
