//
//  tabBarShowHideAnimationUtil.m
//
//  Created by Sugamiya Yusuke on 12/04/19.
//

#import "tabBarShowHideAnimationUtil.h"

@implementation tabBarShowHideAnimationUtil

@synthesize tabBarController = _tabBarController;
@synthesize view             = _view;
@synthesize duration         = _duration;

+ (tabBarShowHideAnimationUtil*)useWithTabBarController:(UITabBarController*)tabBarController
                                                   view:(UIView*)view
                                               duration:(NSTimeInterval)duration
{
    if (tabBarController == nil || view == nil)
        return nil;
    
  tabBarShowHideAnimationUtil* util = [[tabBarShowHideAnimationUtil alloc] init];//DNPP_AUTORELEASE([[tabBarShowHideAnimationUtil alloc] init]);
    if (util) {
        util.tabBarController = tabBarController;
        util.view             = view;
        util.duration         = duration;
    }
    return util;
}

#pragma mark - getter

- (BOOL)isTabBarHidden
{
    BOOL isTabBarHidden = NO;
    if (self.tabBarController != nil && self.view != nil)
        isTabBarHidden = (self.tabBarController.tabBar.frame.origin.y >= self.tabBarController.view.bounds.size.height)?YES:NO;
    return isTabBarHidden;
}

#pragma mark - main

- (void)toggleTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion
{
    if (self.tabBarController == nil || self.view == nil)
        return;
    
    UITabBarController* tabBarController = self.tabBarController;
    UIView*             view             = self.view;
    
    UIView* transitionView = nil;
    for (UIView* inView in tabBarController.view.subviews) {
        if (![inView isKindOfClass:[UITabBar class]]) {
            transitionView = inView;
        }
    }
    
    CGRect viewRect           = view.frame;
    CGRect tabBarRect         = tabBarController.tabBar.frame;
    CGRect transitionViewRect = transitionView.frame;
    
    CGFloat tabBarHeight = tabBarRect.size.height;
    
    if (self.isTabBarHidden) {
        viewRect.size.height           -= tabBarHeight;
        tabBarRect.origin.y            -= tabBarHeight;
        transitionViewRect.size.height -= tabBarHeight;
    } else {
        viewRect.size.height           += tabBarHeight;
        tabBarRect.origin.y            += tabBarHeight;
        transitionViewRect.size.height += tabBarHeight;
    }
    
    [UIView animateWithDuration:self.duration
                     animations:^{
                         tabBarController.tabBar.frame = tabBarRect;
                         view.frame                    = viewRect;
                         transitionView.frame          = transitionViewRect;
                     } completion:^(BOOL finished) {
                         if (completion)
                             completion();
                     }];
}

- (void)showTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion
{
    if (self.isTabBarHidden)
        [self toggleTabBarUsingAnimationWithCompletion:completion];
}

- (void)hideTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion
{
    if (!self.isTabBarHidden)
        [self toggleTabBarUsingAnimationWithCompletion:completion];
    
}

@end
