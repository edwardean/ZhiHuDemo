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
  
  CGRect barButtonFrame = CGRectMake(0, 0, 44, 30);
  
  UIImage *barNormalImage = [[UIImage imageNamed:@"NavigationBarButtonNormal.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
  UIImage *barHighlightImage = [[UIImage imageNamed:@"NavigationBarButtonHighlight.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
  
  UIImage *leftBarSearchImage = [UIImage imageNamed:@"ZHNavigationBarSearchIcon.png"];
  UIImageView *leftBarSearchImgView = [[UIImageView alloc] initWithImage:leftBarSearchImage];
  
  UIButton *leftbutton = [[UIButton alloc] initWithFrame:barButtonFrame];
  [leftbutton setBackgroundImage:barNormalImage forState:UIControlStateNormal];
  [leftbutton setBackgroundImage:barHighlightImage forState:UIControlStateHighlighted];
  [leftbutton addSubview:leftBarSearchImgView];
  [leftBarSearchImgView setCenter:leftbutton.center];
  
  UIButton *rightbutton = [[UIButton alloc] initWithFrame:barButtonFrame];
  [rightbutton setBackgroundImage:barNormalImage forState:UIControlStateNormal];
  [rightbutton setBackgroundImage:barHighlightImage forState:UIControlStateHighlighted];
  [[rightbutton titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0f]];
  [[rightbutton titleLabel] setTextColor:[UIColor whiteColor]];
  [[rightbutton titleLabel] setShadowColor:[UIColor grayColor]];
  [[rightbutton titleLabel] setShadowOffset:CGSizeMake(0, -1)];
  [rightbutton setTitle:@"提问" forState:UIControlStateNormal];
  
  UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:
                                     leftbutton];
  
  UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightbutton];
  
  self.navigationItem.leftBarButtonItem = leftButtonItem;
  self.navigationItem.rightBarButtonItem = rightButtonItem;
  
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
