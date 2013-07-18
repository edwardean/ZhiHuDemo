//
//  ZHListViewDataSource.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZHListView/ZHListViewCell.h>

@interface ZHListViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Class listCellClass;

@property (nonatomic, strong) NSArray *objects;

@end
