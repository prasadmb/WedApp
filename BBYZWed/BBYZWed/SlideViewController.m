//
//  ViewController.m
//  BBYZWed
//
//  Created by Prasad on 7/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import "SlideViewController.h"
#import "SoundManager.h"
#import "UIImage+animatedGIF.h"
#import "ImageSlideViewController.h"
#import "AddThis.h"
#import "RNGridMenu.h"
#import "ZoomViewController.h"
#import "LocationViewController.h"

#define kAnimationDuration          0.25f

@interface SlideViewController ()
@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@property (strong,nonatomic) IBOutlet KASlideShow * slideshow;
@property (strong,nonatomic) IBOutlet UIImageView * ronyImageView;
@property (strong,nonatomic) IBOutlet UIImageView * sherinImageView;
@property (strong,nonatomic) IBOutlet UIImageView * wedsImageView;
@property (strong,nonatomic) IBOutlet UIImageView * snowImageView1;
@property (strong,nonatomic) IBOutlet UIImageView * snowImageView2;
@property (strong,nonatomic) IBOutlet UIImageView * starImageView1;
@property (strong,nonatomic) IBOutlet UIImageView * starImageView2;
@property (strong,nonatomic) IBOutlet UIImageView * starImageView3;
@property (strong,nonatomic) IBOutlet UIImageView * starImageView4;
@property (strong,nonatomic) IBOutlet UIImageView * dateImageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SlideViewController

@synthesize ronyImageView;
@synthesize sherinImageView;
@synthesize wedsImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [SoundManager sharedManager].allowsBackgroundMusic = YES;
        [[SoundManager sharedManager] prepareToPlay];
        [[SoundManager sharedManager] playMusic:@"Jashn-E-Bahaaraa (Instrumental Music) - Jodhaa Akbar" looping:YES];

    self.imageView.layer.borderWidth = 2;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = CGRectGetHeight(self.imageView.bounds) / 2;
    self.imageView.clipsToBounds = YES;
    
    RNLongPressGestureRecognizer *longPress = [[RNLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.view addGestureRecognizer:longPress];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];


    NSURL *ronyIconurl = [[NSBundle mainBundle] URLForResource:@"Rony" withExtension:@"gif"];
    self.ronyImageView.image = [UIImage animatedImageWithAnimatedGIFURL:ronyIconurl duration:kAnimationDuration];
    NSURL *sherinIconurl = [[NSBundle mainBundle] URLForResource:@"Sherin" withExtension:@"gif"];
    self.sherinImageView.image = [UIImage animatedImageWithAnimatedGIFURL:sherinIconurl duration:kAnimationDuration];
    NSURL *wedsIconurl = [[NSBundle mainBundle] URLForResource:@"love" withExtension:@"gif"];
    self.wedsImageView.image = [UIImage animatedImageWithAnimatedGIFURL:wedsIconurl duration:2.5];
    NSURL *snowiconurl = [[NSBundle mainBundle] URLForResource:@"snow" withExtension:@"gif"];
    self.snowImageView1.image = [UIImage animatedImageWithAnimatedGIFURL:snowiconurl duration:0.75];
    self.snowImageView2.image = [UIImage animatedImageWithAnimatedGIFURL:snowiconurl duration:0.75];
    NSURL *stariconurl = [[NSBundle mainBundle] URLForResource:@"star" withExtension:@"gif"];
    self.starImageView1.image = [UIImage animatedImageWithAnimatedGIFURL:stariconurl duration:0.75];
    self.starImageView2.image = [UIImage animatedImageWithAnimatedGIFURL:stariconurl duration:0.75];
    self.starImageView3.image = [UIImage animatedImageWithAnimatedGIFURL:stariconurl duration:0.75];
    self.starImageView4.image = [UIImage animatedImageWithAnimatedGIFURL:stariconurl duration:0.75];
    NSURL *dateiconurl = [[NSBundle mainBundle] URLForResource:@"date" withExtension:@"gif"];
    self.dateImageView.image = [UIImage animatedImageWithAnimatedGIFURL:dateiconurl duration:0.75];
     self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];
    [self shareKit];
   }

- (void)showGrid {
    NSInteger numberOfOptions = 6;
    NSArray *items = @[
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu1"] title:@"Invitation"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu2"] title:@"Gallery"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu3"] title:@"Location"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu4"] title:@"Facebook"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu5"] title:@"Twitter"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"menu6"] title:@"Email"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"twitterButton"] title:@"Video"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"twitterButton"] title:@"About"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"twitterButton"] title:@"Cancel"]
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}
#pragma mark - Target/Action

- (IBAction)onShowButton:(id)sender {
    [self showGrid];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
    }
}

#pragma mark - RNGridMenuDelegate

- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex {
    NSLog(@"Dismissed with item %d: %@", itemIndex, item.title);
    switch (itemIndex) {
        case 0: {
            ZoomViewController *zoomVC=[[ZoomViewController alloc]initWithNibName:@"ZoomViewController" bundle:nil];
           // UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:zoomVC];
            [self presentViewController:zoomVC animated:NO completion:nil];
        }
            break;

        case 1: {
            ImageSlideViewController *slideShow=[[ImageSlideViewController alloc]init];
            [self presentViewController:slideShow animated:NO completion:nil];
        }
            break;
        case 2: {
            LocationViewController *location=[[LocationViewController alloc]init];
            [self presentViewController:location animated:NO completion:nil];
        }
            break;

        case 3:
            [AddThisSDK shareImage:[UIImage imageNamed:@"Default.png"]
                       withService:@"facebook"
                             title:@"Check this out"
                       description:@"Hi....."];
            break;
        case 4:
            [AddThisSDK shareImage:[UIImage imageNamed:@"Default.png"]
                       withService:@"twitter"
                             title:@"Check this out"
                       description:@"Hi......"];
            break;
        case 5:
            [AddThisSDK shareImage:[UIImage imageNamed:@"Default.png"]
                       withService:@"mailto"
                             title:@"Check this out"
                       description:@"Hi......"];
            break;
        default:
            break;
    }
   
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (void) shareKit {
    //configure addthis -- (this step is optional)
	[AddThisSDK setNavigationBarColor:[UIColor lightGrayColor]];
	[AddThisSDK setToolBarColor:[UIColor lightGrayColor]];
	[AddThisSDK setSearchBarColor:[UIColor lightGrayColor]];
	
	//Facebook connect settings
	//CHANGE THIS FACEBOOK API KEY TO YOUR OWN!!
	[AddThisSDK setFacebookAPIKey:@"147862618648627"];
	[AddThisSDK setFacebookAuthenticationMode:ATFacebookAuthenticationTypeFBConnect];
	
	//CHANGE THIS TWITTER API KEYS TO YOUR OWN!!
	[AddThisSDK setTwitterConsumerKey:@"LGv5u6rSHT5apS5pQZFDw"];
	[AddThisSDK setTwitterConsumerSecret:@"BPyxJc0plzxm3Z5io4CDsTKK8tO2AJq00rocEukX6I"];
	[AddThisSDK setTwitterCallBackURL:@"http://addthis.com/mobilesdk/twittertesting"];
	
    [AddThisSDK setTwitPicAPIKey:@"45149651ec391a4e2b8135b43a63346b"];
    [AddThisSDK setTwitterAuthenticationMode:ATTwitterAuthenticationTypeOAuth];
  
}

@end
