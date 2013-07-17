//
//  ZHModel.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHObject.h"

@protocol  ZHModel <NSObject>

@end

@interface ZHModel : NSObject <ZHModel>

@property (nonatomic) NSArray *objects;
@property (nonatomic) ZHObject *object;

- (void)bindModelWithObject:(id<ZHObject>)object;

@end
