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

@interface ZHModel : NSObject <ZHModel>

@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) ZHObject *object;

- (void)bindModelWithObject:(id<ZHObject>)object;

@end
