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

#import "ZHProfileBaseCell.h"
#import "ZHProfileNormalStyleCell.h"
#import "ZHProfileCollectionStyleCell.h"
#import "ZHUserProfileWeiboStyleCell.h"
#import "ZHProfileBlacklistStyleCell.h"

@class ZHProfileNormalStyleCell;
@class ZHProfileCollectionStyleCell;
@class ZHUserProfileWeiboStyleCell;
@class ZHProfileBlacklistStyleCell;

typedef struct {
	Class cellclass;
  __unsafe_unretained id cellData;
  ZHProfileCellPositionType cellPostionType;
} cellBaseModel;

@interface ZHUserInfoViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *collectionArray;
@property (nonatomic, copy) NSString *answer_count;
@property (nonatomic, copy) NSString *question_count;
@property (nonatomic, copy) NSString *favorite_count;
@property (nonatomic, strong) NSMutableArray *weiboArray;

@property (nonatomic, strong) UIImageView *accessory;

@property (nonatomic, strong) ZHUserInfoObject *profileObject;

@end

@implementation ZHUserInfoViewController
//@synthesize tableView = tableView_;
@synthesize answer_count = answer_count_;
@synthesize question_count = question_count_;
@synthesize favorite_count = favorite_count_;
@synthesize weiboArray = weiboArray_;
@synthesize accessory = accessory_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.profileObject = [[ZHUserInfoObject alloc] init];
    self.collectionArray = [NSMutableArray arrayWithCapacity:3];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tableView = [[ZHUserInfoListView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  NSArray *detail = @[@"详细信息"];
  NSArray *dongtai = @[@"全部动态",@"答过",@"问过"];
  NSArray *collection = @[@"他的收藏"];
  NSArray *heimingdan = @[@"加入黑名单"];
  NSArray *jubao = @[@"举报"];
  
  self.dataArray = [NSMutableArray arrayWithObjects:detail,dongtai,collection,heimingdan,jubao, nil];
  self.answer_count = @"0";
  self.question_count = @"0";
  self.favorite_count = @"0";
  [self.collectionArray addObject:answer_count_];
  [self.collectionArray addObject:question_count_];
  [self.collectionArray addObject:favorite_count_];
  
  self.weiboArray = [NSMutableArray arrayWithCapacity:0];
  
  UIView *headerBG = [[UIView alloc] initWithFrame:CGRectMake(0, -600, 320, 600)];
  [headerBG setBackgroundColor:[UIColor colorWithRed:245/255.0
                                               green:245.5/255.0
                                                blue:245/255.0
                                               alpha:1.0]];
  
  ZHUserInfoHeaderView *headerView = [[ZHUserInfoHeaderView alloc]
                                      initWithFrame:CGRectMake(0, 0, 320, 1)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHProfileViewTopbg.png"]
                           stretchableImageWithLeftCapWidth:28 topCapHeight:95];
  UIImageView *headerBackGroundView = [[UIImageView alloc] initWithImage:resizedImage];
  [headerView addSubview:headerBackGroundView];
  [headerView addSubview:headerBG];
  
  ZHParser *userInfoParser = [ZHUserInfoFactory ParserFactory];
  ZHModel *userInfoModel = [userInfoParser parser];
  [headerView bindHeaderContentWithObject:userInfoModel.object];
  headerBackGroundView.frame = headerView.frame;
  
  [self.tableView setTableHeaderView:headerView];
  [headerView sendSubviewToBack:headerBackGroundView];
	[self performSelector:@selector(setUpData:)
             withObject:userInfoModel.object
             afterDelay:1.0f];
}

- (void)setUpData:(ZHObject *)object
{
  [self.collectionArray removeAllObjects];
  
  self.profileObject  =(ZHUserInfoObject *)object;
  self.answer_count = @"0";
  if (self.profileObject.answer_count) {
    self.answer_count = self.profileObject.answer_count;
  }
  
  self.question_count = @"0";
  if (self.profileObject.question_count) {
    self.question_count = self.profileObject.question_count;
  }
  
  self.favorite_count = @"0";
  if (self.profileObject.favorite_count) {
    self.favorite_count = self.profileObject.favorite_count;
  }
  
  
  [self.collectionArray addObject:self.answer_count];
  [self.collectionArray addObject:self.question_count];
  [self.collectionArray addObject:self.favorite_count];
  
  
  [self.weiboArray removeAllObjects];
  if (self.profileObject.sina_weibo_name) {
    NSDictionary *sinaname = [NSDictionary dictionaryWithObject:self.profileObject.sina_weibo_name
                                                         forKey:@"sina"];
    [self.weiboArray addObject:sinaname];
  }
  
  if (self.profileObject.qq_weibo_name) {
    NSDictionary *qqname = [NSDictionary dictionaryWithObject:self.profileObject.qq_weibo_name
                                                       forKey:@"qq"];
    [self.weiboArray addObject:qqname];
  }
  for (id obj in self.dataArray) {
    if ([obj isEqualToArray:self.weiboArray]) {
      [self.dataArray removeObject:self.weiboArray];
    }
  }
  [self.dataArray insertObject:self.weiboArray atIndex:WeiboSection];
  [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
  NSInteger section = 0;
  if ([self.weiboArray count] > 0) {
    section = UserProfileSectionCount;
    
  } else {
  	section = UserProfileSectionCount - 1;
  }
  
	return section;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
  NSInteger row = 0;
  NSInteger offset = [self.weiboArray count] > 0 ? 0 : 1;
  NSInteger weiboCount = [self.weiboArray count];
  switch (section) {
    case DetailSection:
      row = UserProfileDetailCount;
      break;
    case TrendsSection:
      row = UserProfileTrendsCount;
      break;
    case CollectionSection:
      row = UserProfileCollectionCount;
      break;
    case WeiboSection:
      if (offset == 0) {
        row = weiboCount;
        break;
      } else {
      	
      }
    case BlacklistSection:
      if (offset == 0) {
        row = UserInfoCellBlacklistCount;
        break;
      } else {
      	if (section == BlacklistSection - offset) {
          row = UserInfoCellBlacklistCount;
          break;
        }
      }
    case ReportSection:
      if (offset == 0) {
        row = UserInfoReportCount;
        break;
      } else {
      	if (section == ReportSection - offset) {
          row = UserInfoReportCount;
          break;
        }
        NSAssert(0, @"Crash");
      }
    default:
      break;
      
  }
  
  return row;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  cellBaseModel cellModel = [self createCellModelInTableView:tableView
                                             forRowIndexPath:indexPath];
  
  Class cellClass = cellModel.cellclass;
  id data = cellModel.cellData;
  
  ZHProfileCellPositionType cellType = cellModel.cellPostionType;
  
  ZHProfileBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
  if (!cell) {
    cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault
                            reuseIdentifier:NSStringFromClass(cellClass)];
  }
	NSLog(@"Out Class:%@",NSStringFromClass(cellClass));
  if ([cellClass isSubclassOfClass:[ZHProfileCollectionStyleCell class]]) {
    NSLog(@"In Class:%@",NSStringFromClass(cellClass));
    NSLog(@"IndexPath:%@",indexPath);
    NSLog(@"Data:%@ Detail\n\n\n",data);
    
    [cell bindCellTitle:data
                 detail:[self.collectionArray objectAtIndex:indexPath.row]
           withCellType:cellType];
  } else {
    [cell bindWithObject:data
            withCellType:cellType];
  }
  
  if (!cell) {
    cell.hidden = YES;
  }
  
	return cell;
}

- (cellBaseModel)createCellModelInTableView:(UITableView *)tableView
                            forRowIndexPath:(NSIndexPath *)indexPath {
	cellBaseModel cellModel;
  cellModel.cellclass = [self cellClassForIndexPath:indexPath];
  cellModel.cellData = [[self.dataArray objectAtIndex:indexPath.section]
                        objectAtIndex:indexPath.row];
  
  ZHProfileCellPositionType cellType;
  
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  if ([tableView numberOfRowsInSection:section] == 1) {
    cellType = CellSingle;
  } else {
    if (row == 0) {
      cellType = CellTop;
    } else if (row == [tableView numberOfRowsInSection:section] - 1) {
  		cellType = CellBottom;
    } else {
    	cellType = CellMiddle;
    }
    
  }
  cellModel.cellPostionType = cellType;
  
  return cellModel;
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  Class cellClass;
  
  NSInteger offset = [self.weiboArray count] > 0 ? 0 : 1;
  switch (section) {
    case DetailSection:
      return [ZHProfileNormalStyleCell class];
    case TrendsSection:
      switch (row) {
        case UserInfoCellAllTrends:
          return [ZHProfileNormalStyleCell class];
        case UserInfoCellAnswered:
          return [ZHProfileCollectionStyleCell class];
        case UserInfoCellQuestioned:
          return [ZHProfileCollectionStyleCell class];
          
        default:
          break;
      }
    case CollectionSection:
      return [ZHProfileCollectionStyleCell class];
      break;
    case WeiboSection:
      if (offset == 0) {
        return [ZHUserProfileWeiboStyleCell class];
      } else {
      	// Do next case...
      }
    case BlacklistSection:
      if (offset == 0) {
        return [ZHProfileBlacklistStyleCell class];
      } else {
        if (section == BlacklistSection - offset) {
          return [ZHProfileBlacklistStyleCell class];
        }
      	// Do next case...
      }
    case ReportSection:
      if (offset == 0) {
        return [ZHProfileBlacklistStyleCell class];
      } else {
        if (section == ReportSection - offset) {
          return [ZHProfileBlacklistStyleCell class];
        }
        // Do next case...
      }
    default:
      break;
  }
  
  return cellClass;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
