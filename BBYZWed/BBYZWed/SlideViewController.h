//
//  ViewController.h
//  BBYZWed
//  Created by Prasad on 7/10/13.
//  Copyright (c) 2013 TMA01. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KASlideShow.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SlideViewController : UIViewController <KASlideShowDelegate> {
AVPlayer *player;
}
@property (weak, nonatomic) IBOutlet UIButton *socialButton;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) NSArray *popups;
- (IBAction)onShowButton:(id)sender;
@end
