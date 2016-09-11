//
//  Utils.m
//  iost3h
//
//  Created by Hoang on 9/9/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "Utils.h"

@implementation Utils
// Tra ve 1 UIImage tu ten file hinh duoc luu trong device
+(UIImage *)getImageWithFileName:(NSString *)filename{
    NSString *imagePath = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/Images/%@", filename]];
    return [UIImage imageWithContentsOfFile:imagePath];
}

// Hien thi thong bao voi 1 nut OK
+(void)showInfoMessage:(NSString *)message fromContext:(UIViewController *)context withOKHandler:(void (^)(UIAlertAction * action))handler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler];
    [alert addAction:okAction];
    [context presentViewController:alert animated:YES completion:nil];
}

// Trang tri text view
+(void)decorateTextView:(UITextView *)textView{
    // Tao padding: top, right, bottom, left
    textView.textContainerInset = UIEdgeInsetsMake(10,10,10,10);
    // Tao border
    [[textView layer] setBorderColor:[[UIColor orangeColor] CGColor]];
    [[textView layer] setBorderWidth:1.5];
    [[textView layer] setCornerRadius:5];
}

// Trang tri image view
+(void)decorateImageView:(UIImageView *)imageView{
    [[imageView layer] setMasksToBounds:YES];
    [[imageView layer] setBorderColor:[[UIColor orangeColor] CGColor]];
    [[imageView layer] setBorderWidth:1.5];
    [[imageView layer] setCornerRadius:5];
}

// Load float label text view
+(void)loadFloatLabelTextViewInView:(UIView *)view withPlaceholder:(NSString *)text andContent:(NSString *)content{
    JVFloatLabeledTextView *floatView = [[JVFloatLabeledTextView alloc] initWithFrame:CGRectZero];
    [Utils decorateTextView:floatView];
    floatView.font = [UIFont systemFontOfSize:14];
    floatView.text = content;
    floatView.placeholder = text;
    floatView.placeholderTextColor = [UIColor darkGrayColor];
    floatView.floatingLabelFont = [UIFont boldSystemFontOfSize:10];
    floatView.floatingLabelXPadding = 10;
    floatView.floatingLabelYPadding = 10;
    floatView.placeholderYPadding = 10;
    floatView.backgroundColor = [UIColor clearColor];
    [floatView setTextColor:[UIColor whiteColor]];
    floatView.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:floatView];
    // Thiet lap auto layout cho text view
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(xMargin)-[floatView]-(xMargin)-|" options:0 metrics:@{@"xMargin": @(0)} views:NSDictionaryOfVariableBindings(floatView)]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(xMargin)-[floatView]-(xMargin)-|" options:0 metrics:@{@"xMargin": @(0)} views:NSDictionaryOfVariableBindings(floatView)]];
}

+(void)changeNavigationBarWithFontName:(NSString *)fontName andTitle:(NSString *)title fromContext:(UIViewController *)context{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 35)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:fontName size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor orangeColor];
    label.text = title;
    [label setAdjustsFontSizeToFitWidth:YES];
    context.navigationItem.titleView = label;
}
@end
