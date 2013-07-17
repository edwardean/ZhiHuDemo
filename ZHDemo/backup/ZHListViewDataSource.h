//
//  ZHListViewDataSource.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHListViewCell.h"

@interface ZHListViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic) Class listCellClass;

//@property (nonatomic) NSInteger sections;

@property (nonatomic) NSArray *objects;

@end
