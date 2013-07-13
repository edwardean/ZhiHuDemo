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
#import "ZHCollectionObject.h"

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
@property (nonatomic) ZHCollectionObject *collectionObject;

@end

@implementation ZHCollectionParser

@synthesize collectionArray = collectionArray_;
@synthesize baseObject = baseObject_;
@synthesize collectionObject = collectionObject_;

- (id)parser
{
  self.baseObject = [[ZHObject alloc] init];
  self.collectionObject = [[ZHCollectionObject alloc] init];
  
	NSData *data = [ZHLoadJSONFile CollectionData];
  NSDictionary *dictionary = [data objectFromJSONData];
  NSArray *dataArray = [dictionary objectForKey:@"data"];
  
	for (id obj in dataArray) {
    NSDictionary *dic = (NSDictionary *)obj;
    NSLog(@"Dic:::%@",dic);
    
    NSString *answer_count = [NSString stringWithFormat:@"%d",[[dic objectForKey:@"answer_count"] integerValue]];//多少个回答
    NSString *title = [dic objectForKey:@"title"];//收藏标题
    NSString *description = [dic objectForKey:@"description"];//描述
    NSString *follower_count = [NSString stringWithFormat:@"%d",[[dic objectForKey:@"follower_count"] integerValue]];
    
    NSDictionary *creator = [dic objectForKey:@"creator"];
    NSString *avatar_url = [creator objectForKey:@"avatar_url"];//头像地址
    NSString *name = [creator objectForKey:@"name"];//用户名
    
    NSMutableDictionary *collectionDictionary = [NSMutableDictionary dictionary];
    if (answer_count) {
      [collectionDictionary setObject:answer_count forKey:@"answer_count"];
    }
    if (title) {
      [collectionDictionary setObject:title forKey:@"title"];
    }
    if (description) {
      [collectionDictionary setObject:description forKey:@"description"];
    }
    if (follower_count) {
      [collectionDictionary setObject:follower_count forKey:@"follower_count"];
    }
    if (name) {
      [collectionDictionary setObject:name forKey:@"name"];
    }
    if (avatar_url) {
      [collectionDictionary setObject:avatar_url forKey:@"avatar_url"];
    }
    
    NSLog(@"%@",collectionDictionary);
    
    ZHCollectionObject *object = [collectionObject_ bindWithObjec:collectionDictionary forObjectType:ZHObjectTypeCollection];
    
    [self.collectionArray addObject:object];
  }
  
  ZHModel *model = [[ZHModel alloc] init];
  model.objects = self.collectionArray;
  return model;
}

@end
