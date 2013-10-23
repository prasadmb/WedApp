//
//  SplashMoviePlayer.m
//  RNFrostedSidebar
//
//  Created by Prasad on 7/10/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "SplashMoviePlayer.h"
#import "VideoPlayerKit.h"

@interface SplashMoviePlayer ()
@property (nonatomic, strong) VideoPlayerKit *videoPlayerViewController;
@property (nonatomic, strong) UIView *topView;
@end

@implementation SplashMoviePlayer


- (id)init
{
    if ((self = [super init])) {
        
        // Optional Top View
        _topView = [[UIView alloc] init];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(0, 0, 200, 40.0);
        [button addTarget:self
                   action:@selector(fullScreen)
         forControlEvents:UIControlEventTouchDown];
        
        [button setTitle:@"" forState:UIControlStateNormal];
        [_topView addSubview:button];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Optional Top View

    
    // Do any additional setup after loading the view from its nib.
}
- (void) viewDidAppear:(BOOL)animated {
    [self play:nil];
}
- (IBAction)play:(id)sender
{
    NSURL *url  =[ NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"a" ofType:@"mov"]];

   // NSURL *url = [NSURL URLWithString:@"http://ignhdvod-f.akamaihd.net/i/assets.ign.com/videos/zencoder/,416/d4ff0368b5e4a24aee0dab7703d4123a-110000,640/d4ff0368b5e4a24aee0dab7703d4123a-500000,640/d4ff0368b5e4a24aee0dab7703d4123a-1000000,960/d4ff0368b5e4a24aee0dab7703d4123a-2500000,1280/d4ff0368b5e4a24aee0dab7703d4123a-3000000,-1354660143-w.mp4.csmil/master.m3u8"];
    
    if (!self.videoPlayerViewController) {
        self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:_topView hideTopViewWithControls:NO];
        self.videoPlayerViewController.hideControls=YES;
        // Need to set edge inset if top view is inserted
        [self.videoPlayerViewController setControlsEdgeInsets:UIEdgeInsetsMake(self.topView.frame.size.height, 0, 0, 0)];
        self.videoPlayerViewController.delegate = self;
        self.videoPlayerViewController.allowPortraitFullscreen = YES;
    }
    
    [self.view addSubview:self.videoPlayerViewController.view];
    
    [self.videoPlayerViewController playVideoWithTitle:@"Title" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:YES];
    [self.videoPlayerViewController hidePlayerControls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
