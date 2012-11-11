//
//  ViewController.m
//  iChad
//
//  Created by Montag, Andrew J on 11/11/12.
//  Copyright (c) 2012 Montag, Andrew J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize our iAd Banner
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    
    // Allow the iAd banner to resize to fit the screen
    [adView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
    // Add the iAd banner to the view
    [self.view addSubview:adView];
    
    adView.delegate = self;
    self.bannerIsVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"bannerViewDidLoad");
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"didFailToRecieveAdWithError:%@", error.description);
    if (self.bannerIsVisible)
    {
        // We don't have an ad to show, so slide the Ad out of view 
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        
        self.bannerIsVisible = NO;
    }
}

@end
