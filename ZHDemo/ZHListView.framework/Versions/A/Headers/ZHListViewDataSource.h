//
//  ZHListViewDataSource.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZHListView/ZHListViewCell.h>

/**************tableViewDataSource基类*****************/
@interface ZHListViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Class listCellClass;	//控制器需要向DataSource注册cell类，以便DataSource完成cell的行为

@property (nonatomic, strong) NSArray *objects;			//控制器提供的数据源数组，与Delegate的数据源相同


@end
