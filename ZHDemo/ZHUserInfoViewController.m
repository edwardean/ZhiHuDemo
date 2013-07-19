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
#import "ZHUserInfoCell.h"

@interface ZHUserInfoViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *answer_count;
@property (nonatomic, copy) NSString *question_count;
@property (nonatomic, copy) NSString *favorite_count;
@property (nonatomic, strong) NSMutableArray *weiboArray;

@end

@implementation ZHUserInfoViewController
@synthesize sections = sections_;
@synthesize answer_count = answer_count_;
@synthesize question_count = question_count_;
@synthesize favorite_count = favorite_count_;
@synthesize weiboArray = weiboArray_;

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
  
  self.sections = 5;
  
  NSArray *detail = @[@"详细信息"];
  NSArray *dongtai = @[@"全部动态",@"答过",@"问过"];
  NSArray *collection = @[@"他的收藏"];
  NSArray *heimingdan = @[@"加入黑名单"];
  NSArray *jubao = @[@"举报"];
  
  self.dataArray = [NSMutableArray arrayWithObjects:detail,dongtai,collection,heimingdan,jubao, nil];
  
  self.sections = self.dataArray.count;
  
  self.answer_count = @"0";
  self.question_count = @"0";
  self.favorite_count = @"0";
  self.weiboArray = [NSMutableArray array];
  
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
  
  [self performSelector:@selector(setUpData:) withObject:userInfoModel.object afterDelay:2.5f];
  
}

- (void)setUpData:(ZHObject *)object
{
	ZHUserInfoObject *userObject = (ZHUserInfoObject *)object;
  if (userObject.answer_count) {
    self.answer_count = userObject.answer_count;
  }
  
  if (userObject.question_count) {
    self.question_count = userObject.question_count;
  }
  
  if (userObject.favorite_count) {
    self.favorite_count = userObject.favorite_count;
  }
  
  if (userObject.sina_weibo_name) {
    [self.weiboArray addObject:userObject.sina_weibo_name];
  }
  
  if (userObject.qq_weibo_name) {
    [self.weiboArray addObject:userObject.qq_weibo_name];
  }
  
  [self.dataArray addObject:self.weiboArray];
  
  [self.tableView reloadData];
  
}

- (void)changeSections
{
  //  [self.tableView beginUpdates];
  //	NSIndexPath *index = [NSIndexPath indexPathForRow:[self.weiboArray count] inSection:2];
  //  [self insertNewSectionWithIndexPath:index];
  //  [self.tableView reloadData];
  //  [self.tableView endUpdates];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"USERINFOCELL";
  ZHUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
  if (!cell) {
    
    cell = [[ZHUserInfoCell alloc] initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:cellIdentifier];
  }
  
  cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]];
  [cell setCellTitle:[[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]
         CountString:@"12"
     isTitleInCenter:NO];
  
  if (indexPath.section == 1) {
		if (indexPath.row == 1) {
    	[cell.countLabel setText:self.answer_count];
    } else if (indexPath.row == 2) {
    	[cell.countLabel setText:self.question_count];
    }
  } else if (indexPath.section == 2) {
  	if (indexPath.row == 0) {
      [cell.countLabel setText:self.favorite_count];
    }
  }
  return cell;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  return [[self.dataArray objectAtIndex:section] count];
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
    [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellSingleNormal.png"]]];
    [cell setSelectedBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellSingleHighlight.png"]]];
  } else {
    
    if (indexPath.row == 0) {
      [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellTopNormal.png"]]];
      [cell setSelectedBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellTopHighlight.png"]]];
      
      
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
      [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellBottomNormal.png"]]];
      [cell setSelectedBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellBottomHighlight.png"]]];
      
    } else {
      [cell setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellMiddleNormal.png"]]];
      
      [cell setSelectedBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ZHCellMiddleHighlight.png"]]];
      
    }
  }
  
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
