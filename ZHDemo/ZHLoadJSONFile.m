//
//  ZHLoadJSONFile.m
//  ZHDemo
//
//  Created by Edward on 13-7-11.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHLoadJSONFile.h"

static NSString * const answer1 = @"answers1";
static NSString * const answer2 = @"answers2";
static NSString * const answer3 = @"answers3";
static NSString * const answer4 = @"answers4";
static NSString * const answer5 = @"answers5";
static NSString * const answer6 = @"answers6";
static NSString * const answer7 = @"answers7";
static NSString * const answer8 = @"answers8";
static NSString * const answer9 = @"answers9";
static NSString * const answer10 = @"answers10";

static NSString * const detail1 = @"detail1";
static NSString * const detail2 = @"detail2";
static NSString * const detail3 = @"detail3";
static NSString * const detail4 = @"detail4";
static NSString * const detail5 = @"detail5";

static NSString * const info1 = @"info1";
static NSString * const info2 = @"info2";
static NSString * const info3 = @"info3";
static NSString * const info4 = @"info4";
static NSString * const info5 = @"info5";
static NSString * const info6 = @"info6";


@interface ZHLoadJSONFile ()

+ (NSString *)AnswersFilePath;

+ (NSString *)AnswerHeaderFilePath;

+ (NSString *)UserDetailFilePath;

+ (NSString *)UserInfoFilePath;

+ (NSString *)CollectionsFilePath;

+ (NSString *)BundleFilePath:(NSString *)fileName;

@end

@implementation ZHLoadJSONFile

+ (NSString *)BundleFilePath:(NSString *)fileName
{
	if (fileName) {
    return [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
  } else {
  	return nil;
  }
}

+ (NSString *)CollectionsFilePath
{
	return [ZHLoadJSONFile BundleFilePath:@"collections"];
}

+ (NSString *)AnswerHeaderFilePath
{
	return [ZHLoadJSONFile BundleFilePath:@"header"];
}

+ (NSString *)UserDetailFilePath
{
  NSArray *array = @[detail1,detail2,detail3,detail4,detail5];
  NSUInteger arrayIndex = arc4random() % [array count];
	NSString *filePath =  [array objectAtIndex:arrayIndex];
  return [ZHLoadJSONFile BundleFilePath:filePath];
}

+ (NSString *)UserInfoFilePath
{
	NSArray *array = @[info1,info2,info3,info4,info5,info6];
  NSUInteger arrayIndex = arc4random() % [array count];
  NSString *filePath = [array objectAtIndex:arrayIndex];
  return [ZHLoadJSONFile BundleFilePath:filePath];
}

+ (NSString *)AnswersFilePath
{
  NSArray *array = @[answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10];
  NSUInteger arrayIndex = arc4random() % [array count];
  NSString *filePath = [array objectAtIndex:arrayIndex];
	return [ZHLoadJSONFile BundleFilePath:filePath];
}

+ (NSData *)CollectionData
{
	return  [NSData dataWithContentsOfFile:[ZHLoadJSONFile CollectionsFilePath]];
}

+ (NSData *)UserDetailData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile UserDetailFilePath]];
}

+ (NSData *)UserInfoData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile UserInfoFilePath]];
}

+ (NSData *)AnswerData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile AnswersFilePath]];
}

+ (NSData *)AnswerHeaderData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile AnswerHeaderFilePath]];
}

@end
