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
  
	self.title = @"最新动态";
  
  UIImage *leftBarSearchImage = [UIImage imageNamed:@"ZHNavigationBarSearchIcon.png"];

  self.navigationItem.leftBarButtonItem = [ZHBarButtonItem BarButtonItemWithImage:leftBarSearchImage block:^(){
  	[[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Left" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
  }];
  self.navigationItem.rightBarButtonItem = [ZHBarButtonItem BarButtonItemWithTitle:@"提问" block:^(){
//  	[[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Right" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    ZHUserInfoViewController *userInfoVC = [[ZHUserInfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:userInfoVC animated:YES];
  }];
  
  [self dataReady];
  
}

- (void)dataReady
{
	ZHParser *parser = [ZHFeedsParserFactory ParserFactory];
  ZHModel *model = [parser parser];
  self.myModel = model;
  [self modelDidFinishLoading:model];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.myModel.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"ZHCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cell) {
    cell = [[ZHFeedBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  cell.textLabel.text = [[self.myModel.objects objectAtIndex:indexPath.row] valueForKey:@"title"];
  return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
    //Signal
    NSLog(@"%@ Signal",indexPath);
  } else {
  	if (indexPath.row == 0) {
      //Top
      NSLog(@"%@ Top",indexPath);
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
    	// Last
      NSLog(@"%@ Last",indexPath);
    } else {
    	//Middle
      NSLog(@"%@ Middle",indexPath);
    }
  }
}
@end
