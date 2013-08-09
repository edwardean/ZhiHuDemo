//
//  ZHUserDetailViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHUserDetailViewController.h"
#import "ZHUserDetailView.h"

@interface ZHUserDetailViewController ()

@end

@implementation ZHUserDetailViewController

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
  
  ZHUserDetailView *detailView = [[ZHUserDetailView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
  [detailView setBackgroundColor:/*[UIColor clearColor]];*/[UIColor colorWithRed:245/255.0
                                                 green:245.5/255.0
                                                  blue:245/255.0
                                                 alpha:1.0]];
  [self.listView setTableHeaderView:detailView];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [act setCenter:self.view.center];
  [act startAnimating];
  [self.view addSubview:act];
  [self processImageDataWithBlock:^(NSData *imageData) {
    UIImage *image = [UIImage imageWithData:imageData];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [imgView setCenter:self.view.center];
    [self.view addSubview:imgView];
    [act stopAnimating];
  }];
}

- (void)processImageDataWithBlock:(void (^)(NSData *imageData))processImage
{
  dispatch_queue_t callQueue = dispatch_get_main_queue();
  dispatch_queue_t downloadQueue = dispatch_queue_create("downloadQueue", NULL);
  dispatch_async(downloadQueue, ^{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img.brothersoft.com/screenshots/softimage/h/hot_girl_wallpaper-389365-1280492107.jpeg"]];
    dispatch_async(callQueue, ^{
      processImage(imageData);
    });
  });
  
  // dispatch_release(downloadQueue);
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
