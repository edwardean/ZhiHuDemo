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

@interface ZHObject : NSObject <ZHObject>

+ (id)objectWithData:(id)data;

- (void)bindWithObject:(id)object;

@end
