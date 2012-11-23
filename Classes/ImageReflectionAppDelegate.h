//
//  ImageReflectionAppDelegate.h
//  ImageReflection
//
//  Created by Macbook on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageReflectionViewController.h"

@interface ImageReflectionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	ImageReflectionViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) ImageReflectionViewController *viewController;

@end

