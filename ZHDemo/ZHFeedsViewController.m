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

@interface ZHFeedsViewController ()

@end

@implementation ZHFeedsViewController

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
  
  [self registerCellClass:[ZHFeedsAnswerCell class]];
  
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
  
  [self performSelector:@selector(dataReady) withObject:nil afterDelay:2.5f];
  
}

- (void)dataReady
{
	ZHParser *parser = [ZHFeedsParserFactory ParserFactory];
  ZHModel *model = [parser parser];
  
  [self modelDidFinishLoading:model];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
