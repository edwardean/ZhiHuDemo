//
//  ZHUserInfoViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHListView.h>
#import "ZHUserInfoViewController.h"
#import "ZHUserInfoObject.h"
#import "ZHUserInfoFactory.h"
#import "ZHParser.h"
#import "ZHUserInfoHeaderView.h"
#import "ZHAnswerCell.h"

@interface ZHUserInfoViewController ()

@end

@implementation ZHUserInfoViewController

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
  
  [self registerCellClass:[ZHAnswerCell class]];
  
  ZHUserInfoHeaderView *headerView = [[ZHUserInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHProfileViewTopbg.png"] stretchableImageWithLeftCapWidth:28 topCapHeight:95];
  UIImageView *headerBackGroundView = [[UIImageView alloc] initWithImage:resizedImage];
  [headerView addSubview:headerBackGroundView];
  
  ZHParser *userInfoParser = [ZHUserInfoFactory ParserFactory];
  ZHModel *userInfoModel = [userInfoParser parser];
  [headerView bindHeaderContentWithObject:userInfoModel.object];
  headerBackGroundView.frame = headerView.frame;
  
  [self.listView setTableHeaderView:headerView];
  [headerView sendSubviewToBack:headerBackGroundView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
