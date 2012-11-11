//
//  ViewController.h
//  iChad
//
//  Created by Montag, Andrew J on 11/11/12.
//  Copyright (c) 2012 Montag, Andrew J. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate> {
    ADBannerView *adView;
}

@property BOOL bannerIsVisible;

@end
