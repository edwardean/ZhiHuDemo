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
  UINavigationController *collectionNav = [[UINavigationController alloc] initWithRootViewController:collectionViewController];
  collectionNav.tabBarItem.title = @"发现";
  collectionNav.tabBarItem.image = [UIImage imageNamed:@"ExploreNormal.png"];
  collectionNav.tabBarItem.selectedImage = [UIImage imageNamed:@"ExploreSelected.png"];
  
  
  ZHAnswerViewController *answerController = [[ZHAnswerViewController alloc]
                                              initWithNibName:nil
                                              bundle:nil];
  UINavigationController *answerNav = [[UINavigationController alloc] initWithRootViewController:answerController];
  answerNav.tabBarItem.title = @"消息";
  answerNav.tabBarItem.image = [UIImage imageNamed:@"NotificationNormal.png"];
  answerNav.tabBarItem.selectedImage = [UIImage imageNamed:@"NotificationSelected.png"];
  
  ZHFeedsViewController *feedsViewController = [[ZHFeedsViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
  UINavigationController *feedNav = [[UINavigationController alloc] initWithRootViewController:feedsViewController];
  feedNav.tabBarItem.title = @"首页";
  feedNav.tabBarItem.image = [UIImage imageNamed:@"FeedNormal.png"];
  feedNav.tabBarItem.selectedImage = [UIImage imageNamed:@"FeedSelected.png"];
  
  ZHUserInfoViewController *userInfoController = [[ZHUserInfoViewController alloc]
                                                  initWithNibName:nil
                                                  bundle:nil];
  UINavigationController *userInfoNav = [[UINavigationController alloc] initWithRootViewController:userInfoController];
  userInfoNav.tabBarItem.title = @"我";
  
  //伪代码
  //  if ([user isFemale]) {
  //    userInfoNav.tabBarItem.image = [UIImage imageNamed:@"FemaleNormal.png"];
  //    userInfoNav.tabBarItem.selectedImage = [UIImage imageNamed:@"FemaleSelected.png"];
  //  } else {
  userInfoNav.tabBarItem.image = [UIImage imageNamed:@"MaleNormal.png"];
  userInfoNav.tabBarItem.selectedImage = [UIImage imageNamed:@"MaleSelected.png"];
  //  }
  
  // self.navigationConreoller = [[UINavigationController alloc]
  //initWithRootViewController:feedsViewController];
  
  
  //  if ([[self.navigationConreoller navigationBar] respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
  //    [[self.navigationConreoller navigationBar] setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
  //  }
  
  NSArray *tabVCArray = @[collectionNav,answerNav,userInfoNav,feedNav];
  for (UINavigationController *nav in tabVCArray) {
    [[nav navigationBar] setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
  }
  UITabBarController *tabViewController = [[UITabBarController alloc] init];
  [tabViewController setViewControllers:@[feedNav,collectionNav,answerNav,userInfoNav]];
  
  self.window = [[UIWindow alloc]
                 initWithFrame:[[UIScreen mainScreen]bounds]];
  
  self.window.rootViewController = tabViewController;//self.navigationConreoller;
  
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)customAppraeance
{
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
