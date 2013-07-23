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


@interface ZHUserInfoViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
//@property (nonatomic, strong) UITableView *tableView;
@end
