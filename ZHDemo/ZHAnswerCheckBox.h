//
//  ZHAnswerCheckBox.h
//  ZHAnswerCheckBox
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHAnswerCheckBox;

@protocol ZHAnswerCheckboxDelegate <NSObject>

- (void)checkbox:(ZHAnswerCheckBox *)checkBox didChangeState:(BOOL)selected;

@end

@interface ZHAnswerCheckBox : UIControl

@property (nonatomic, assign) id <ZHAnswerCheckboxDelegate> delegate;


+ (id)checkBoxNormalTitle:(NSString *)normalTitle SelectedTitle:(NSString *)selectedTitle;

@end
