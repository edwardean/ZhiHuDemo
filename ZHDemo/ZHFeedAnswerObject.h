//
//  ZHFeedAnswerObject.h
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHFeedsObject.h"

@interface ZHFeedAnswerObject : ZHFeedsObject

@property (nonatomic, copy) NSString *verb;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar_url;
@property (nonatomic, copy) NSString *excerpt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *voteup_count;
@property (nonatomic, copy) NSArray *actors;

@end
