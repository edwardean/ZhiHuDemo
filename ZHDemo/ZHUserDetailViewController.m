//
//  ZHUserDetailViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserDetailViewController.h"
#import "ZHUserDetailView.h"

@interface ZHUserDetailViewController ()

@end

@implementation ZHUserDetailViewController

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
  
  ZHUserDetailView *detailView = [[ZHUserDetailView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  [detailView setBackgroundColor:[UIColor clearColor]];//[UIColor colorWithRed:245/255.0
//                                                 green:245.5/255.0
//                                                  blue:245/255.0
//                                                 alpha:1.0]];
  [self.listView setTableHeaderView:detailView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
