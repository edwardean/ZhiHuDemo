//
//  ZHAppDelegate.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHCollectionViewController.h"
#import "ZHAnswerViewController.h"
#import "ZHUserInfoViewController.h"
#import "ZHFeedsViewController.h"

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [self customAppraeance];
  
  ZHCollectionViewController *collectionViewController = [[ZHCollectionViewController alloc]
                                                          initWithNibName:nil
                                                          bundle:nil];
  UINavigationController *collectionNav = [[UINavigationController alloc]
                                           initWithRootViewController:collectionViewController];
  collectionNav.tabBarItem.title = @"发现";
  [collectionNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"ExploreSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"ExploreNormal.png"]];
  
  
  ZHAnswerViewController *answerController = [[ZHAnswerViewController alloc]
                                              initWithNibName:nil
                                              bundle:nil];
  UINavigationController *answerNav = [[UINavigationController alloc]
                                       initWithRootViewController:answerController];
  answerNav.tabBarItem.title = @"消息";
  [answerNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"NotificationSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"NotificationNormal.png"] ];
  
  ZHFeedsViewController *feedsViewController = [[ZHFeedsViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
  UINavigationController *feedNav = [[UINavigationController alloc] initWithRootViewController:feedsViewController];
  feedNav.tabBarItem.title = @"首页";
  [feedNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"FeedSelected.png"]
                   withFinishedUnselectedImage:[UIImage imageNamed:@"FeedNormal.png"]];
  
  ZHUserInfoViewController *userInfoController = [[ZHUserInfoViewController alloc]
                                                  initWithNibName:nil
                                                  bundle:nil];
  UINavigationController *userInfoNav = [[UINavigationController alloc]
                                         initWithRootViewController:userInfoController];
  userInfoNav.tabBarItem.title = @"我";
  
  //伪代码
  //  if ([user isFemale]) {
  //    [userInfoNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"FemaleSelected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"FemaleNormal.png"]];
  //  } else {
  
  [userInfoNav.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"MaleSelected.png"]
                       withFinishedUnselectedImage:[UIImage imageNamed:@"MaleNormal.png"]];
  //  }
  
  
  NSArray *tabVCArray = @[feedNav,collectionNav,answerNav,userInfoNav];
  
  UITabBarController *tabViewController = [[UITabBarController alloc] init];
  [tabViewController setViewControllers:tabVCArray];
  
  self.window = [[UIWindow alloc]
                 initWithFrame:[[UIScreen mainScreen]bounds]];
  
  self.window.rootViewController = tabViewController;
  
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)customAppraeance
{
  [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
  
  [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"NavigationBarBackButtonNormal.png"]
                                                              stretchableImageWithLeftCapWidth:13
                                                              topCapHeight:14]
                                                    forState:UIControlStateNormal
                                                  barMetrics:UIBarMetricsDefault];
  
  [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"NavigationBarBackButtonHighlight.png"]
                                                              stretchableImageWithLeftCapWidth:13
                                                              topCapHeight:14]
                                                    forState:UIControlStateHighlighted
                                                  barMetrics:UIBarMetricsDefault];
  
  UIImage *barBackImage = [UIImage imageNamed:@"TabbarBase.png"];
	[[UITabBar appearance] setBackgroundImage:barBackImage];
  
  UIImage *IndicatorImage = [[UIImage imageNamed:@"TabbarIconSelectedBackground.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
  [[UITabBar appearance] setSelectionIndicatorImage:IndicatorImage];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  
}

@end
