//
//  LocationViewController.m
//  BBYZWed
//
//  Created by Prasad on 20/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (nonatomic,strong) IBOutlet UIWebView *webview;

@end

@implementation LocationViewController

@synthesize webview=_webview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString* url = @"https://maps.google.com.sg/maps?q=St+Marys+Orthodox+Cathedral+Church+Puthencavu,+Chengannur,+Kerala,+India.&fb=1&gl=sg&hq=St+Marys+Orthodox+Cathedral+Church+Puthencavu,+Chengannur,+Kerala,+India.&cid=0,0,13127731126085249783";
    
    NSURL* nsUrl = [NSURL URLWithString:url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [self.webview loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
