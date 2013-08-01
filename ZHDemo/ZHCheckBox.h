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
 unselectedNormalBgImage:(UIImage *)unselectedImage
unselectedHighlightImage:(UIImage *)unselectedHighlightImage
   selectedNormalBgImage:(UIImage *)selectedNormalBgImage
selectedHighlightImage:(UIImage *)selectedHighlightImage;


/**
 *
 **/
+ (id)checkBoxWithNormalTitle:(NSString *)normalTitle
                SelectedTitle:(NSString *)selectedTitle
                     NorImage:(UIImage *)norImage
                SelectedImage:(UIImage *)selectedImage
        unselectedNormalBgImg:(UIImage *)unselectedBgImg
     unselectedHighlightBgImg:(UIImage *)unselectedHighlightBgImg
          selectedNormalBgImg:(UIImage *)selectedNormalBgImg
       selectedHighlightBgImg:(UIImage *)selectedHighlightBgImg;

@end
