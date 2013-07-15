//
//  ZHListViewDelegate.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHListViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic) NSArray *objects;

@property (nonatomic) Class listCellClass;

@property (nonatomic) UIView *cellHeaderView;

@property (nonatomic) UIView *cellFooterView;

@property (nonatomic) UIImage *cellBackgroundImage;

@end
