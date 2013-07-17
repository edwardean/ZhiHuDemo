//
//  ZHObject.h
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZHObjectType) {
	ZHObjectTypeCollection,
  ZHObjectTypeAnswer,
  ZHObjectTypeAnswerHeader,
  ZHObjectTypeUserInfo,
  ZHObjectTypeUserDetail
};

@protocol ZHObject <NSObject>


@end

@interface ZHObject : NSObject <ZHObject>

@property (nonatomic) ZHObjectType type;

- (id)bindWithObjec:(id)object forObjectType:(ZHObjectType)objecttype;

@end
