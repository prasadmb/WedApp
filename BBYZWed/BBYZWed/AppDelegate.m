//
//  AppDelegate.m
//  BBYZWed
//
//  Created by Prasad on 7/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import "AppDelegate.h"
#import "SplashMoviePlayer.h"
#import "SlideViewController.h"
#import "VideoPlayerKit.h"
#import "FacebookSDK.h"

@implementation AppDelegate
@synthesize slideViewController;
@synthesize splashMoviePlayer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showHomeScreen)
                                                 name:@"VideoPlayerSplashVideoEndNotification"
                                               object:nil];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self showHomeScreen];
    //[self showSplashScreen];
    [self.window makeKeyAndVisible];
    
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Jashn-E-Bahaaraa (Instrumental Music) - Jodhaa Akbar.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    audioPlayer.numberOfLoops = -1;
    [audioPlayer play];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void) showSplashScreen {
    self.splashMoviePlayer=[[SplashMoviePlayer alloc] init];
    self.window.rootViewController=splashMoviePlayer;
}

- (void) showHomeScreen {
    self.slideViewController = [[SlideViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController=slideViewController;

}
@end
