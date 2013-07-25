//
//  ZHCollectionViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionCell.h"
#import "ZHParser.h"
#import "ZHCollectionFactory.h"
#import "ZHCollectionViewController.h"
#import "ZHUserInfoViewController.h"

@interface ZHCollectionViewController ()

@end

@implementation ZHCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"热门收藏";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIImage *barImage = [UIImage imageNamed:@"ZHNavigationBarShuffleIcon.png"];

  self.navigationItem.rightBarButtonItem = [ZHBarButtonItem BarButtonItemWithImage:barImage block:^(){
  	[[[UIAlertView alloc] initWithTitle:@"Collection" message:@"Right" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
  }];
  
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
