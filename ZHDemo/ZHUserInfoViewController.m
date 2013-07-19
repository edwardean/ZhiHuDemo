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
#import "ZHUserInfoListView.h"

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
  
  self.tableView = [[ZHUserInfoListView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  UIView *headerBG = [[UIView alloc] initWithFrame:CGRectMake(0, -600, 320, 600)];
  [headerBG setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245.5/255.0 blue:245/255.0 alpha:1.0]];
  
  ZHUserInfoHeaderView *headerView = [[ZHUserInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHProfileViewTopbg.png"] stretchableImageWithLeftCapWidth:28 topCapHeight:95];
  UIImageView *headerBackGroundView = [[UIImageView alloc] initWithImage:resizedImage];
  [headerView addSubview:headerBackGroundView];
  [headerView addSubview:headerBG];
  
  ZHParser *userInfoParser = [ZHUserInfoFactory ParserFactory];
  ZHModel *userInfoModel = [userInfoParser parser];
  [headerView bindHeaderContentWithObject:userInfoModel.object];
  headerBackGroundView.frame = headerView.frame;
  
  
  [self.tableView setTableHeaderView:headerView];
  [headerView sendSubviewToBack:headerBackGroundView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
