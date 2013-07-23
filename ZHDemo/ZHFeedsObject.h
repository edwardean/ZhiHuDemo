//
//  ZHFeedsObject.h
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHListView.h>

@interface ZHFeedsObject : ZHObject

@property (nonatomic, copy) NSString *excerpt;					//描述
@property (nonatomic, copy) NSString *voteup_count;			//赞同统计
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *avata_url;
@property (nonatomic, strong) NSArray *actors;					//赞同该回答的人

/*
 actors:
 headline
 avatar_url
 name
 gender
 
 */
@end
