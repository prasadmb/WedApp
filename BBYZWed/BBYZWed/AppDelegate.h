//
//  AppDelegate.h
//  BBYZWed
//
//  Created by Prasad on 7/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SplashMoviePlayer;
@class SlideViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SplashMoviePlayer *splashMoviePlayer;
@property (strong, nonatomic) SlideViewController *slideViewController;

@end
