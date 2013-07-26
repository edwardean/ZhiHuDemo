//
//  ZHListViewDelegate.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

/**************tableViewDelegate基类*****************/
@interface ZHListViewDelegate : NSObject <UITableViewDelegate>


@property (nonatomic, strong) NSArray *objects;				//控制器提供的数据源数组，与DataSource的数据源相同

@property (nonatomic, strong) Class listCellClass;		//控制器需要向delegate注册cell类，以便delegate完成cell的行为

@end
