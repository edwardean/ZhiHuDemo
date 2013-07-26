//
//  ZHObject.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZHObject <NSObject>

@end

/************数据单元基类****************/
@interface ZHObject : NSObject <ZHObject>

/**
 * [对外数据绑定接口]
 * @param data [外层传递过来的数据，常见为NSDictionary类型]
 * @return [返回一个具体化的子类对象]
 **/
+ (id)objectWithData:(id)data;

/**
 * [子类具体实现数据绑定的接口]
 * @param object [Description]
 **/
- (void)bindWithObject:(id)object;

@end
