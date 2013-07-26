//
//  ZHListViewCell.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

/*************tableViewCell基类，Default样式**************/
@interface ZHListViewCell : UITableViewCell

/**
 * [控制器向每一个cell提供数据，子类重写加载数据]
 * @param object [一个数据单元对象]
 **/
- (void)bindWithObject:(id)object;

/**
 * [在cell展示内容之前根据数据内容计算cell高度，子类必须重写，否则返回默认行高]
 * @param object [一个数据单元对象]
 * @return [返回计算好的正确cell高度]
 **/
+ (CGFloat)RowHeightWitObject:(id)object;

@end
