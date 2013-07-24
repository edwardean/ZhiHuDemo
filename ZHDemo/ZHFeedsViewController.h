//
//  ZHFeedsViewController.h
//  ZHDemo
//
//  Created by Edward on 13-7-23.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#define AnswerCreate	 		@"回答该问题"
#define QuestionFollow 		@"关注该问题"
#define AnswerVoteUp	 		@"赞同该回答"

#import <ZHListView/ZHListView.h>

typedef NS_ENUM(NSInteger, FeedCellType) {
	FeedCellTypeAnswerCreate,
  FeedCellTypeQuestionFollow,
  FeedCellTypeAnswerVoteUp
};

@interface ZHFeedsViewController : ZHListViewController <UITableViewDataSource, UITableViewDelegate>



@end
