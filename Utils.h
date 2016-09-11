//
//  Utils.h
//  iost3h
//
//  Created by Hoang on 9/9/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextView.h"

// Define some constants
#define kDBFileName @"cookbookgo"
#define kFontName1 @"Ariston"
#define kFontName2 @"UVN Sang Song Nang"

@interface Utils : NSObject
+(UIImage *)getImageWithFileName:(NSString *)filename;
+(void)showInfoMessage:(NSString *)message fromContext:(UIViewController *)context withOKHandler:(void (^)(UIAlertAction * action))handler;
+(void)decorateTextView:(UITextView *)textView;
+(void)decorateImageView:(UIImageView *)imageView;
+(void)loadFloatLabelTextViewInView:(UIView *)view withPlaceholder:(NSString *)text andContent:(NSString *)content;
+(void)changeNavigationBarWithFontName:(NSString *)fontName andTitle:(NSString *)title fromContext:(UIViewController *)context;
@end
