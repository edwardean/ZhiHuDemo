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
  
  ZHCollectionViewController *collectionViewController = [[ZHCollectionViewController alloc]
                                                          initWithNibName:nil
                                                          bundle:nil];
  
  
  ZHAnswerViewController *answerController = [[ZHAnswerViewController alloc]
                                              initWithNibName:nil
                                              bundle:nil];
  
  ZHUserInfoViewController *userInfoController = [[ZHUserInfoViewController alloc]
                                                  initWithNibName:nil
                                                  bundle:nil];
  
  ZHFeedsViewController *feedsViewController = [[ZHFeedsViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
  
  self.navigationConreoller = [[UINavigationController alloc]
                               initWithRootViewController:answerController];
  
  
  if ([[self.navigationConreoller navigationBar] respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
    [[self.navigationConreoller navigationBar] setBackgroundImage:[UIImage imageNamed:@"NavigationBar.png"] forBarMetrics:UIBarMetricsDefault];
  } 
  
  
  self.window = [[UIWindow alloc]
                 initWithFrame:[[UIScreen mainScreen]bounds]];
  
  self.window.rootViewController = self.navigationConreoller;
  
  [self.window makeKeyAndVisible];
  
  return YES;
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
