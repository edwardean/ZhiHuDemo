//
//  ZHAnswerViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHParser.h"
#import "ZHModel.h"
#import "ZHAnswerFactory.h"
#import "ZHAnswerHeaderFactory.h"
#import "ZHAnswerHeaderObject.h"
#import "ZHAnswerCell.h"
#import "ZHListView.h"
#import "ZHAnswerHeaderView.h"
#import "ZHListViewDelegate.h"
#import "ZHAnswerViewController.h"

@interface ZHAnswerViewController ()

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *des;
@property (nonatomic) NSString *avatar_url;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *follower_count;
@property (nonatomic) NSString *comment_count;

@end

@implementation ZHAnswerViewController

@synthesize title = title_;
@synthesize des = des_;
@synthesize avatar_url = avatar_url_;
@synthesize name = name_;
@synthesize follower_count = follower_count_;
@synthesize comment_count = comment_count_;

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
  
	// Header View
  ZHAnswerHeaderView *headerView = [[ZHAnswerHeaderView alloc]
                                    initWithFrame:CGRectMake(0, 0, 320, 1)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHExploreFavTopBase.png"]
                           stretchableImageWithLeftCapWidth:28
                           topCapHeight:28];
  
	UIImageView *imgView = [[UIImageView alloc] initWithImage:resizedImage];
  headerView.clipsToBounds = NO;
  imgView.clipsToBounds = YES;
  
  [headerView addSubview:imgView];
  
  ZHParser *answerHeaderParser = [ZHAnswerHeaderFactory ParserFactory];
  ZHModel *answerHeaderModel = [answerHeaderParser parser];
  [headerView bindHeaderContentWithObject:answerHeaderModel.object];
  imgView.frame = headerView.bounds;
  
  // Cell
  // 设置cell背景图片，默认为单张cell图片进行拉伸，之后再根据计算放上分割线
  UIImage *cellBackgroundImage = [UIImage imageNamed:@"ZHExploreListItemBase.png"];
                                  //stretchableImageWithLeftCapWidth:11 topCapHeight:22];
  
  UIImage *image = [cellBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 6, 15) resizingMode:UIImageResizingModeStretch];
  
  self.listViewDelegate.cellBackgroundImage = image;
  
  ZHParser *cellContentsParser = [ZHAnswerFactory ParserFactory];
  ZHModel *cellContentsModel = [cellContentsParser parser];
  
  [self numberOfSectionForListView:cellContentsModel.objects.count];
  [self modelDidFinishLoading:cellContentsModel];
  
  [self.listView setTableHeaderView:headerView];
  [headerView sendSubviewToBack:imgView];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
