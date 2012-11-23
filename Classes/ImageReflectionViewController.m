//
//  ImageReflectionViewController.m
//  ImageReflection
//
//  Created by Macbook on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	
//
//

#import "ImageReflectionViewController.h"


@implementation ImageReflectionViewController
#pragma mark - Image Reflection

- (void) loadView {
	[super loadView];
	self.view.backgroundColor = [UIColor blackColor];
	
	UIImage *image = [UIImage imageNamed:@"spongebob.png"];
	
	UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
	
	// Slice image into half
	CGImageRef imageToSplit = image.CGImage;
	CGImageRef partOfImageAsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0,image.size.height/2,image.size.width, image.size.height/2));
	UIImage *partOfImage = [UIImage imageWithCGImage:partOfImageAsCG];
	
	// flip the image upside-down in mirror view
	UIImage* flippedImage = [UIImage imageWithCGImage:partOfImage.CGImage scale:1.0 orientation:  UIImageOrientationDownMirrored];
	UIImageView *reflectionView = [[UIImageView alloc]initWithImage:flippedImage];
	reflectionView.frame = CGRectMake(0, image.size.height, image.size.width, image.size.height/2);
	
	
	
	UIGraphicsBeginImageContext(CGSizeMake(imageView.image.size.width,imageView.image.size.height+reflectionView.image.size.height));  
	
	CGRect imageRect = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
	CGRect reflectionRect = CGRectMake(0, imageView.image.size.height, reflectionView.image.size.width, reflectionView.image.size.height);
	
	[imageView.image drawInRect:imageRect]; 
	
	// Set-up transparency of the reflection image
	[reflectionView.image drawInRect:reflectionRect blendMode:kCGBlendModeScreen alpha:0.5];  
	
	UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();  
	UIGraphicsEndImageContext();
	
	UIImageView *resultingView = [[UIImageView alloc]initWithImage:resultingImage];
	[self.view addSubview:resultingView];


}

- (void) dealloc {
	[super dealloc];
}
@end
