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


static NSString * const header1 = @"header1";
static NSString * const header2 = @"header2";
static NSString * const header3 = @"header3";
static NSString * const header4 = @"header4";
static NSString * const header5 = @"header5";
static NSString * const header6 = @"header6";
static NSString * const header7 = @"header7";
static NSString * const header8 = @"header8";
static NSString * const header9 = @"header9";
static NSString * const header10 = @"header10";

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
static NSString * const info7 = @"info7";
static NSString * const info8 = @"info8";
static NSString * const info9 = @"info9";
static NSString * const info10 = @"info10";


static NSString * const collections1 = @"collections1";
static NSString * const collections2 = @"collections2";
static NSString * const collections3 = @"collections3";
static NSString * const collections4 = @"collections4";
static NSString * const collections5 = @"collections5";
static NSString * const collections6 = @"collections6";
static NSString * const collections7 = @"collections7";
static NSString * const collections8 = @"collections8";
static NSString * const collections9 = @"collections9";
static NSString * const collections10 = @"collections10";
static NSString * const collections11 = @"collections11";


static NSString * const feeds1 = @"feeds1";
static NSString * const feeds2 = @"feeds2";
static NSString * const feeds3 = @"feeds3";
static NSString * const feeds4 = @"feeds4";
static NSString * const feeds5 = @"feeds5";

static NSString * const detailanswers1 = @"detailanswers1";
static NSString * const detailanswers2 = @"detailanswers2";
static NSString * const detailanswers3 = @"detailanswers3";
static NSString * const detailanswers4 = @"detailanswers4";
static NSString * const detailanswers5 = @"detailanswers5";
static NSString * const detailanswers6 = @"detailanswers6";
static NSString * const detailanswers7 = @"detailanswers7";
static NSString * const detailanswers8 = @"detailanswers8";
static NSString * const detailanswers9 = @"detailanswers9";
static NSString * const detailanswers10 = @"detailanswers10";

static NSString * const question1 = @"question1";
static NSString * const question2 = @"question2";
static NSString * const question3 = @"question3";
static NSString * const question4 = @"question4";
static NSString * const question5 = @"question5";
static NSString * const question6 = @"question6";
static NSString * const question7 = @"question7";
static NSString * const question8 = @"question8";
static NSString * const question9 = @"question9";
static NSString * const question10 = @"question10";

static NSString * const topics1 = @"topics1";
static NSString * const topics2 = @"topics2";
static NSString * const topics3 = @"topics3";
static NSString * const topics4 = @"topics4";
static NSString * const topics5 = @"topics5";
static NSString * const topics6 = @"topics6";
static NSString * const topics7 = @"topics7";
static NSString * const topics8 = @"topics8";
static NSString * const topics9 = @"topics9";
static NSString * const topics10 = @"topics10";

@interface ZHLoadJSONFile ()

+ (NSString *)AnswersFilePath;

+ (NSString *)AnswerHeaderFilePath;

+ (NSString *)UserDetailFilePath;

+ (NSString *)UserInfoFilePath;

+ (NSString *)CollectionsFilePath;

+ (NSString *)FeedsFilePath;

+ (NSString *)DetailAnswerTopicsFilePath;

+ (NSString *)DetailAnswersQuestionFilePath;

+ (NSString *)DetailAnswerAnswersFilePath;

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

+ (NSString *)RandomFilePathFromArray:(NSArray *)array
{
	NSUInteger arrayIndex = arc4random() % [array count];
  return [array objectAtIndex:arrayIndex];
}

+ (NSString *)CollectionsFilePath
{
  NSArray *array = @[collections1,collections2,collections3,collections4,collections5,collections6,collections7,collections8,collections9,collections10,collections11];
	return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)FeedsFilePath
{
	NSArray *array = @[feeds1,feeds2,feeds3,feeds4,feeds5];
  
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)AnswerHeaderFilePath
{
  NSArray *array = @[header1,header10,header2,header3,header4,header5,header6,header7,header8,header9];
	return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)UserDetailFilePath
{
  NSArray *array = @[detail1,detail2,detail3,detail4,detail5];
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)UserInfoFilePath
{
	NSArray *array = @[info1,info2,info3,info4,info5,info6,info7,info8,info9,info10];
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)AnswersFilePath
{
  NSArray *array = @[answer1,answer2,answer3,answer4,answer5,answer6,answer7,answer8,answer9,answer10];
	return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)DetailAnswerTopicsFilePath
{
	NSArray *array = @[topics1,topics10,topics2,topics3,topics4,topics5,topics6,topics7,topics8,topics9];
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)DetailAnswersQuestionFilePath
{
	NSArray *array = @[question1,question10,question2,question3,question4,question5,question6,question7,question8,question9];
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
}

+ (NSString *)DetailAnswerAnswersFilePath
{
	NSArray *array = @[detailanswers1,detailanswers10,detailanswers2,detailanswers3,detailanswers4,detailanswers5,detailanswers6,detailanswers7,detailanswers8,detailanswers9];
  return [ZHLoadJSONFile BundleFilePath:[ZHLoadJSONFile RandomFilePathFromArray:array]];
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

+ (NSData *)FeedsData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile FeedsFilePath]];
}

+ (NSData *)DetailAnswerTopicsData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile DetailAnswerTopicsFilePath]];
}

+ (NSData *)DetailAnswerQuestionData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile DetailAnswersQuestionFilePath]];
}

+ (NSData *)DetailAnswerAnswersData
{
	return [NSData dataWithContentsOfFile:[ZHLoadJSONFile DetailAnswerAnswersFilePath]];
}

@end
