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
  
  
  ZHAnswerViewController *answerController = [[ZHAnswerViewController alloc]
                                              initWithNibName:nil
                                              bundle:nil];
  UINavigationController *answerNav = [[UINavigationController alloc] initWithRootViewController:answerController];
  
  ZHUserInfoViewController *userInfoController = [[ZHUserInfoViewController alloc]
                                                  initWithNibName:nil
                                                  bundle:nil];
  UINavigationController *userInfoNav = [[UINavigationController alloc] initWithRootViewController:userInfoController];
  
  ZHFeedsViewController *feedsViewController = [[ZHFeedsViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
  UINavigationController *feedNav = [[UINavigationController alloc] initWithRootViewController:feedsViewController];
  
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
