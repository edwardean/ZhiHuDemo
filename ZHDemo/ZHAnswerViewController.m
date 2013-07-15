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
  
  ZHAnswerHeaderView *headerView = [[ZHAnswerHeaderView alloc]
                                    initWithFrame:CGRectMake(12, 12, 296, 10)];
  
  UIImage *resizedImage = [[UIImage imageNamed:@"ZHExploreFavTopBase.png"]
                           stretchableImageWithLeftCapWidth:28
                           topCapHeight:28];
  [headerView addSubview:[[UIImageView alloc] initWithImage:resizedImage]];
  self.listViewDelegate.cellHeaderView = headerView;
  
  ZHParser *answerHeaderParser = [ZHAnswerHeaderFactory ParserFactory];
  ZHModel *answerHeaderModel = [answerHeaderParser parser];
  [self bindHeaderContentWithObject:answerHeaderModel.object];
  
  ZHParser *cellContentsParser = [ZHAnswerFactory ParserFactory];
  ZHModel *cellContentsModel = [cellContentsParser parser];
  //////////////////////////////////////////////////////////////////////////////////
  [self numberOfSectionForListView:cellContentsModel.objects.count];
  [self modelDidFinishLoading:cellContentsModel];
  
}


- (void)bindHeaderContentWithObject:(id<ZHObject>)object
{
	ZHAnswerHeaderObject *answerObject = (ZHAnswerHeaderObject *)object;
  self.title = answerObject.title;
  self.des = answerObject.des;
  self.avatar_url = answerObject.avatar_url;
  self.name = answerObject.name;
  self.follower_count = answerObject.follower_count;
  self.comment_count = answerObject.comment_count;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
