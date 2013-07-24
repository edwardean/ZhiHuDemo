//
//  ZHFeedBaseCell.h
//  ZHDemo
//
//  Created by Edward on 13-7-24.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import <ZHListView/ZHListView.h>

#define LINEBREAKBYTRUNCATINGTAIL  NSLineBreakByTruncatingTail
#define TEXTALIGNMENTCENTER				 NSTextAlignmentCenter

// global
#define CELLCONTENTMARGINTOLEFT				10
#define CELLCONTENTMARGINTORIGHT			10
#define CELLCONTENTMARGINTOTOP				10
#define CELLCONTENTMARGINTOBOTTOM			10

#define CELLTITLELABELWIDTH						260
#define CELLTITLELABELHEIGHT					45

#define CELLEXCERPTLABELWIDTH					265
#define CELLEXCERPTLABELHEIGHT				55
// detail
#define MARGINBEWTEENTWOCONTENT				8			//每两个子视图间距都为8
#define ACTORSLABELFONTSIZE						13.0f
#define TITLELABELFONTSIZE						15.0f
#define EXCERPTLABELFONTSIZE					14.0f

@interface ZHFeedBaseCell : ZHListViewCell

@end
