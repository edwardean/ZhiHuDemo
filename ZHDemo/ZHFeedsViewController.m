//
//  ZHFeedsViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsViewController.h"
#import "ZHFeedsAnswerCell.h"
#import "ZHParser.h"
#import "ZHFeedsParserFactory.h"
#import "ZHFeedBaseCell.h"
#import "ZHUserInfoViewController.h"

@interface ZHFeedsViewController ()
@property (nonatomic, strong) ZHModel *myModel;
@end

@implementation ZHFeedsViewController
@synthesize myModel = myModel_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = @"最新动态";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.myModel = [[ZHModel alloc] init];
  
  [self registerCellClass:[ZHFeedsAnswerCell class]];
  
  //[self.listView setDelegate:self];
  //[self.listView setDataSource:self];
  
  UIImage *leftBarSearchImage = [UIImage imageNamed:@"ZHNavigationBarSearchIcon.png"];

  self.navigationItem.leftBarButtonItem = [ZHBarButtonItem BarButtonItemWithImage:leftBarSearchImage
                                                                            block:^(){
  	[[[UIAlertView alloc] initWithTitle:@"Alert"
                                message:@"Left"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
  }];
  self.navigationItem.rightBarButtonItem = [ZHBarButtonItem BarButtonItemWithTitle:@"提问"
                                                                             block:^(){
  	[[[UIAlertView alloc] initWithTitle:@"Alert"
                                message:@"Right"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
  }];
  
  [self dataReady];
  
}

- (void)dataReady
{
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    ZHParser *parser = [ZHFeedsParserFactory ParserFactory];
    ZHModel *model = [parser parser];
    self.myModel = model;
    
    dispatch_async(dispatch_get_main_queue(), ^{
      [self modelDidFinishLoading:model];
    });
    
  });
}

- (void)viewDidLayoutSubviews
{
	NSLog(@"Frame:%@",NSStringFromCGRect(self.view.frame));
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
