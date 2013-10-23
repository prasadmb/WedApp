//
//  ImageSlideViewController.m
//  BBYZWed
//
//  Created by Prasad on 11/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import "ImageSlideViewController.h"
#import "KASlideShow.h"
@interface ImageSlideViewController () <KASlideShowDelegate>
@property (strong,nonatomic) IBOutlet KASlideShow * slideshow;
- (IBAction)dismiss :(id)sender;
@end

@implementation ImageSlideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self runSlide];
    // Do any additional setup after loading the view from its nib.
}

- (void) runSlide {
    _slideshow.delegate = self;
    [_slideshow setDelay:2]; // Delay between transitions
    [_slideshow setTransitionDuration:0.5]; // Transition duration
    [_slideshow setTransitionType:KASlideShowTransitionFade]; // Choose a transition type (fade or slide)
    [_slideshow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [_slideshow addImagesFromResources:@[@"Default.png",@"Default.png",@"Default.png"]]; // Add images from
    //[_slideshow setTransitionType:KASlideShowTransitionFade];
    [_slideshow setTransitionType:KASlideShowTransitionSlide];
    [_slideshow start];
    
}

#pragma mark - KASlideShow delegate

- (void)kaSlideShowDidNext
{
    NSLog(@"kaSlideShowDidNext");
}

-(void)kaSlideShowDidPrevious
{
    NSLog(@"kaSlideShowDidPrevious");
}

- (IBAction)dismiss :(id)sender {
     _slideshow.delegate = nil;
    [self dismissViewControllerAnimated:NO
                             completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
