//
//  ZHQuestionViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-26.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHQuestionViewController.h"
#import "ZHQuestionCell.h"

@interface ZHQuestionViewController ()

@property (nonatomic, strong) ZHModel *model;

@end

@implementation ZHQuestionViewController
@synthesize model = model_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"回答";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.model = [[ZHModel alloc] init];
  
  [self registerCellClass:[ZHQuestionCell class]];
  
  self.navigationItem.rightBarButtonItem = [ZHBarButtonItem BarButtonItemWithImage:[UIImage imageNamed:@"ZHNavigationBarActionIcon.png"]
                                                                             block:^{
                                                                               
                                                                             }];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
