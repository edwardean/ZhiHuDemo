//
//  ZHProfileBase.h
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHListView.h>

typedef enum {
  CellPositionUnknow = 0,
  CellPositionTop,
  CellPositionMiddle,
  CellPositionBottom,
  CellPositionSingle,
  } ZHCellPositionType;

@interface ZHProfileBaseCell : ZHListViewCell

@property (nonatomic, assign) ZHCellPositionType cellType;

/**
 绑定数据，设置列表样式
 功能：
 1 cell 背景图片设置
 2 绑定数据，会执行 bindWithObject:(id)object
*/

- (void)bindWithObject:(id)object
          withCellType:(ZHCellPositionType)aCellType;

- (void)bindCellTitle:(NSString *)title
               detail:(NSString *)detail
         withCellType:(ZHCellPositionType)aCellType;

- (void)bindCellTitle:(NSString *)title
               detail:(NSString *)detail;

@end
