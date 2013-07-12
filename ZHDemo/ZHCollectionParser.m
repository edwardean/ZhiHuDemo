//
//  ZHCollectionParser.m
//  ZHDemo
//
//  Created by Edward on 13-7-12.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHCollectionParser.h"
#import "ZHLoadJSONFile.h"
#import "ZHObject.h"

@interface ZHCollectionParser ()

/**
 热门收藏页展示的五个基本数据
 标题，描述，用户头像，用户名，回答次数
 **/
@property (nonatomic) NSString *title;
@property (nonatomic) NSNumber *answer_count;
@property (nonatomic) NSString *avatar_url;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;

@property (nonatomic) NSMutableArray *collectionArray;

@property (nonatomic) ZHObject *baseObject;

@end

@implementation ZHCollectionParser
@synthesize collectionArray = collectionArray_;
@synthesize baseObject = baseObject_;

- (id)parser
{
  self.baseObject = [[ZHObject alloc] init];
  
	NSData *data = [ZHLoadJSONFile CollectionData];
  NSDictionary *dictionary = [data objectFromJSONData];
  NSArray *dataArray = [dictionary objectForKey:@"data"];
  
	for (NSDictionary *dic in dataArray) {
    NSLog(@"Dic:::%@",dic);
    
    NSString *answer_count = [NSString stringWithFormat:@"%d",[[dic objectForKey:@"answer_count"] integerValue]];//多少个回答
    NSString *title = [dic objectForKey:@"title"];//收藏标题
    NSString *description = [dic objectForKey:@"description"];//描述
    NSString *follower_count = [NSString stringWithFormat:@"%d",[[dic objectForKey:@"follower_count"] integerValue]];
    
    NSDictionary *creator = [dic objectForKey:@"creator"];
    NSString *avatar_url = [creator objectForKey:@"avatar_url"];//头像地址
    NSString *name = [creator objectForKey:@"name"];//用户名
    
    NSDictionary *collectionDictionary = @{@"answer_count": answer_count,
                                           @"title":title,
                                           @"description" : description,
                                           @"follower_count":follower_count,
                                           @"name":name,
                                           @"avatar_url":avatar_url};
    NSLog(@"%@",collectionDictionary);
    
    id object = [baseObject_ bindWithObjec:collectionDictionary forObjectType:ZHObjectTypeCollection];
    
    //[self.collectionArray addObject:collectionDictionary];
    [self.collectionArray addObject:object];
  }
  ZHModel *model = [[ZHModel alloc] init];
  model.objects = self.collectionArray;
  return model;
}

@end
