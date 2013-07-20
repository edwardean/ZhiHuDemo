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

#import "ZHProfileNormalStyleCell.h"
#import "ZHProfileCollectionStyleCell.h"
#import "ZHUserProfileWeiboStyleCell.h"
#import "ZHProfileBlacklistStyleCell.h"

typedef NS_ENUM(NSInteger, UserProfileDetail) {				//详细信息
  UserInfoCellDetail = 0,
  UserProfileDetailCount
};

typedef NS_ENUM(NSInteger, UserProfileTrends) {				//动态
  UserInfoCellAllTrends = 0,
  UserInfoCellAnswered,
  UserInfoCellQuestioned,
  UserProfileTrendsCount
};

typedef NS_ENUM(NSInteger, UserProfileCollection) {		//收藏
	UserInfoCellCollection = 0,
  UserProfileCollectionCount
};

typedef NS_ENUM(NSInteger, UserInfoWeibo) {						//微博
	UserInfoCellWeiboSina = 0,
  UserInfoCellWeiboQQ,
  UserInfoCellWeiboCount
};

typedef NS_ENUM(NSInteger, UserInfoBlacklist) {				//黑名单
	UserInfoCellBlacklist = 0,
  UserInfoCellBlacklistCount
  
};

typedef NS_ENUM(NSInteger, UserInfoReport) {					//举报
	USerInfoCellReport = 0,
  UserInfoReportCount
};

typedef NS_ENUM(NSInteger, UserProfileSection) {
	DetailSection = 0,
  TrendsSection,
  CollectionSection,
  WeiboSection,
  BlacklistSection,
  ReportSection,
  UserProfileSectionCount
};

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
@synthesize answer_count = answer_count_;
@synthesize question_count = question_count_;
@synthesize favorite_count = favorite_count_;
@synthesize weiboArray = weiboArray_;
@synthesize accessory = accessory_;

@synthesize profileObject = profileObject_;

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
  
  self.accessory = [[UIImageView alloc]
                    initWithImage:[UIImage imageNamed:@"ZHListViewArrowRight.png"]];
  NSArray *detail = @[@"详细信息"];
  NSArray *dongtai = @[@"全部动态",@"答过",@"问过"];
  NSArray *collection = @[@"他的收藏"];
  NSArray *heimingdan = @[@"加入黑名单"];
  NSArray *jubao = @[@"举报"];
  
  self.dataArray = [NSMutableArray arrayWithObjects:detail,dongtai,collection,heimingdan,jubao, nil];
  
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
  
  [self performSelector:@selector(setUpData:) withObject:userInfoModel.object afterDelay:4.5f];
  
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
  
  if (self.profileObject.sina_weibo_name) {
    NSDictionary *sinaname = [NSDictionary dictionaryWithObject:self.profileObject.sina_weibo_name forKey:@"sina"];
    [self.weiboArray addObject:sinaname];
  }
  
  if (self.profileObject.qq_weibo_name) {
    NSDictionary *qqname = [NSDictionary dictionaryWithObject:self.profileObject.qq_weibo_name forKey:@"qq"];
    [self.weiboArray addObject:qqname];
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
      row = [self.weiboArray count];
      break;
    case BlacklistSection:
      row = UserInfoCellBlacklistCount;
      break;
    case ReportSection:
      row = UserInfoReportCount;
      break;
    default:
      break;
  }
  return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *normalCellID = @"NORMAL";
  static NSString *collectionCellID = @"COLLECTION";
  static NSString *weiboCellID = @"WEIBO";
  static NSString *blackCellID = @"BLACK";
  
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
	
  UITableViewCell *cell = nil;
  
  switch (section) {
    case DetailSection:
      switch (row) {
        case UserInfoCellDetail:
          cell = [tableView dequeueReusableCellWithIdentifier:normalCellID];
          if (!cell) {
            cell = [[ZHProfileNormalStyleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:normalCellID];
          }
          [(ZHProfileNormalStyleCell *)cell bindCellTitle:[[self.dataArray
                                                            objectAtIndex:DetailSection]
                                                           objectAtIndex:UserInfoCellDetail]];
          break;
          
        default:
          break;
      }
      break;
      
    case TrendsSection:
      switch (row) {
        case UserInfoCellAllTrends:
          cell = [tableView dequeueReusableCellWithIdentifier:normalCellID];
          if (!cell) {
            cell = [[ZHProfileNormalStyleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:normalCellID];
          }
          
          [(ZHProfileNormalStyleCell *)cell
           bindCellTitle:[[self.dataArray
                           objectAtIndex:TrendsSection]
                          objectAtIndex:UserInfoCellAllTrends]];
          break;
          
        case UserInfoCellAnswered:
          cell = [tableView dequeueReusableCellWithIdentifier:collectionCellID];
          if (!cell) {
            cell = [[ZHProfileCollectionStyleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:collectionCellID];
          }
          [(ZHProfileCollectionStyleCell *)cell bindCellTitle:[[self.dataArray
                                                                objectAtIndex:TrendsSection]
                                                               objectAtIndex:UserInfoCellAnswered]
                                                        count:self.answer_count];
          break;
          
        case UserInfoCellQuestioned:
          cell = [tableView dequeueReusableCellWithIdentifier:collectionCellID];
          if (!cell) {
            cell = [[ZHProfileCollectionStyleCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:collectionCellID];
          }
          [(ZHProfileCollectionStyleCell *)cell
           bindCellTitle:[[self.dataArray objectAtIndex:TrendsSection]
                          objectAtIndex:UserInfoCellQuestioned]
           count:self.question_count];
          break;
          
        default:
          break;
          
      }
      
      break;
      
    case CollectionSection:
      switch (row) {
        case UserInfoCellCollection:
          cell = [tableView dequeueReusableCellWithIdentifier:collectionCellID];
          if (!cell) {
            cell = [self setupCellWithClass:[ZHProfileCollectionStyleCell class]
                            reuseIdentifier:collectionCellID];
          }
          [(ZHProfileCollectionStyleCell *)cell bindCellTitle:[[self.dataArray
                                                                objectAtIndex:CollectionSection]
                                                               objectAtIndex:UserInfoCellCollection]
                                                        count:self.favorite_count];
          break;
          
        default:
          break;
      }
      
      break;
      
    case WeiboSection:
      switch (row) {
        case UserInfoCellWeiboSina:
          cell = [tableView dequeueReusableCellWithIdentifier:weiboCellID];
          if (!cell) {
            cell = [self setupCellWithClass:[ZHUserProfileWeiboStyleCell class]
                            reuseIdentifier:weiboCellID];
          }
          
          [(ZHUserProfileWeiboStyleCell *)cell
           bindWeiboObject:[self.weiboArray objectAtIndex:UserInfoCellWeiboSina]];
          break;
          
        case UserInfoCellWeiboQQ:
          cell = [tableView dequeueReusableCellWithIdentifier:weiboCellID];
          if (!cell) {
            cell = [self setupCellWithClass:[ZHUserProfileWeiboStyleCell class]
                            reuseIdentifier:weiboCellID];
          }
          
          [(ZHUserProfileWeiboStyleCell *)cell
           bindWeiboObject:[self.weiboArray objectAtIndex:UserInfoCellWeiboQQ]];
          break;
          
        default:
          break;
      }
      
      break;
      
      
    case BlacklistSection:
      switch (row) {
        case UserInfoCellBlacklist:
          cell = [tableView dequeueReusableCellWithIdentifier:blackCellID];
          if (!cell) {
            cell = [self setupCellWithClass:[ZHProfileBlacklistStyleCell class]
                            reuseIdentifier:blackCellID];
          }
          
          [(ZHProfileBlacklistStyleCell *)cell
           bindCellTitle:[[self.dataArray
                           objectAtIndex:BlacklistSection]
                          objectAtIndex:UserInfoCellBlacklist]];
          break;
          
        default:
          break;
      }
      break;
      
    case ReportSection:
      switch (row) {
        case USerInfoCellReport:
          cell = [tableView dequeueReusableCellWithIdentifier:blackCellID];
          if (!cell) {
            cell = [self setupCellWithClass:[ZHProfileBlacklistStyleCell class]
                            reuseIdentifier:blackCellID];
          }
          [(ZHProfileBlacklistStyleCell *)cell
           bindCellTitle:[[self.dataArray
                           objectAtIndex:ReportSection]
                          objectAtIndex:USerInfoCellReport]];
          break;
          
        default:
          NSAssert(0, @"Overflow cell");
          break;
      }
      break;
      
      
    default:
      NSAssert(0, @"Overflow section");
      break;
  }
  
  return cell;
}


- (UITableViewCell *)setupCellWithClass:(Class)class reuseIdentifier:(NSString *)reuseid
{
  return [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
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
