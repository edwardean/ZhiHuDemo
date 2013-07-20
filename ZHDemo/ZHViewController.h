//
//  ZHViewController.h
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *arrayOfSections;

@end
