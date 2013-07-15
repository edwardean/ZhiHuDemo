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

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application
		didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  ZHCollectionViewController *viewController = [[ZHCollectionViewController alloc]
                                                initWithNibName:nil
                                                bundle:nil];
  
  
  ZHAnswerViewController *answerController = [[ZHAnswerViewController alloc]
                                              initWithNibName:nil
                                              bundle:nil];
  
  
  self.navigationConreoller = [[UINavigationController alloc]
                               initWithRootViewController:answerController];
  
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
