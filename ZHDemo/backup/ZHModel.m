//
//  ZHModel.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHModel.h"

@implementation ZHModel

@synthesize object = object_;
@synthesize objects = objects_;

- (void)bindModelWithObject:(id<ZHObject>)object
{
	[[[ZHObject alloc] init] bindWithObjec:object
                           forObjectType:ZHObjectTypeAnswer];
}

@end
