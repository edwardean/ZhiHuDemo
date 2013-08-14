//
//  tabBarShowHideAnimationUtil.h
//
//  Created by Sugamiya Yusuke on 12/04/19.
//

#import <Foundation/Foundation.h>

typedef void (^tabBarShowHideAnimationCompletionBlock)(void);

@interface tabBarShowHideAnimationUtil : NSObject

@property (nonatomic, assign)    UITabBarController* tabBarController;
@property (nonatomic, assign)    UIView*             view;
@property (nonatomic, readwrite) NSTimeInterval      duration;
@property (nonatomic, readonly)  BOOL                isTabBarHidden;

+ (tabBarShowHideAnimationUtil*)useWithTabBarController:(UITabBarController*)tabBarController
                                                   view:(UIView*)view
                                               duration:(NSTimeInterval)duration;

- (void)toggleTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion;
- (void)showTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion;
- (void)hideTabBarUsingAnimationWithCompletion:(tabBarShowHideAnimationCompletionBlock)completion;

@end
