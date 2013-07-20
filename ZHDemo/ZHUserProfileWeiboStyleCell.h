//
//  ZHUserInfoWeiboCell.h
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeiboType) {
  SinaWeibo = 0,
  QQWeibo,
};


@interface ZHUserProfileWeiboStyleCell : UITableViewCell

- (void)bindWeiboCellWithType:(WeiboType)type weiboName:(NSString *)weiboName;

- (void)bindWeiboObject:(NSDictionary *)weiboDic;

@end
