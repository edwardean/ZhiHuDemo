//
//  ZHCheckBox.h
//  ZHCheckBox
//
//  Created by Edward on 13-7-18.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHCheckBox;

@protocol ZHCheckBoxDelegate <NSObject>

- (void)checkbox:(ZHCheckBox *)checkBox
  didChangeState:(BOOL)selected;

@end

@interface ZHCheckBox : UIControl

@property (nonatomic, assign) id <ZHCheckBoxDelegate> delegate;

+ (id)checkBoxWithSize:(CGSize)size
           NormalTitle:(NSString *)normalTitle
         SelectedTitle:(NSString *)selectedTitle
 unselectedNormalImage:(UIImage *)unselectedImage
unselectedHighlightImage:(UIImage *)unselectedHighlightImage
   selectedNormalImage:(UIImage *)selectedNormalImage
selectedHighlightImage:(UIImage *)selectedHighlightImage;

@end
