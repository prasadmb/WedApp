//
//  ZoomViewController.m
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ZoomViewController.h"

@implementation ZoomViewController

- (void) viewDidLoad {
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 76, self.view.frame.size.width, self.view.frame.size.height)];
	scroll.backgroundColor = [UIColor whiteColor];
	scroll.delegate = self;
	image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card.JPG"]];
	scroll.contentSize = image.frame.size;
	[scroll addSubview:image];
	scroll.minimumZoomScale = scroll.frame.size.width / image.frame.size.width;
	scroll.maximumZoomScale = 1.0;
	[scroll setZoomScale:0.21];
    [self.view addSubview:scroll];
    [scroll setContentOffset:CGPointMake(305, 0) animated:NO];

    [scroll release];
    [super viewDidLoad];
}
- (void)viewDidUnload {
	[image release], image = nil;
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
	CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }

    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
	
	return frameToCenter;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
   image.frame = [self centeredFrameForScrollView:scrollView andUIView:image];;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return image;
}


- (void)dealloc {
    [super dealloc];
}

@end
