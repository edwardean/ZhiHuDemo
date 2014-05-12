//
//  ZHUserInfoViewController.h
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHListViewController.h>
#import <UIKit/UITableViewController.h>
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


// MyProfileSection

typedef NS_ENUM(NSInteger, MyProfileSection) {
	MyProfileSectionDetail = 0,
  MyProfileSectionTrends,
  MyProfileSectionFollow,
  MyProfileSectionWeibo,
  MyProfileSectionSearchFriend,
  MyProfileSectionFeedBack,
  MyProfileSectionExit,
  MyProfileSectionCount
};


typedef NS_ENUM(NSInteger, MyProfileDetailCell) {
	MyProfileDetailCellDetail = 0,
  MyProfileDetailCellCount
};

typedef NS_ENUM(NSInteger, MyProfileTrandsCell) {
	MyProfileTrandsCellAllTrands = 0,
  MyProfileTrandsCellQuestioned,
  MyProfileTrandsCellAnswered,
  MyProfileTrandsCellCount
};

typedef NS_ENUM(NSInteger, MyProfileFollowCell) {
	MyProfileFollowCellMyFollowQuestions = 0,
  MyProfileFollowCellMyCollections,
  MyProfileFollowCellMyDraft,
  MyProfileFollowCellCount
};

typedef NS_ENUM(NSInteger, MyProfileWeiboCell) {
	MyProfileWeiboCellSina = 0,
  MyProfileWeiboCellQQ,
  MyProfileWeiboCellCount
};

typedef NS_ENUM(NSInteger, MyProfileFeedBackCell) {
	MyProfileFeedBackCellFeed = 0,
  MyProfileFeedBackCellCount
};

typedef NS_ENUM(NSInteger, MyProfileExitCell) {
	MyProfileExitCellExit = 0,
  MyProfileExitCellCount
};

@interface ZHUserInfoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
