//
//  ZHModel.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZHListView/ZHObject.h>

@protocol  ZHModel <NSObject>

@end

/***********数据模型，包含数据和数据处理单元，数据处理单元有待扩展**********/
@interface ZHModel : NSObject <ZHModel>

@property (nonatomic, strong) NSArray *objects;			//数据单元集合
@property (nonatomic, strong) ZHObject *object;			//独立的数据单元

/**
 * [基本数据单元与数据模型绑定接口]
 * @param object [基本数据单元，必须是ZHObject子类，且符合ZHObject协议]
 **/
- (void)bindModelWithObject:(id<ZHObject>)object;

@end
