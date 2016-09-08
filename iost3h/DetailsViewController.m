//
//  DetailsViewController.m
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

#pragma mark Custom Functions

-(void)initData{
    // Doi font cho navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 35)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:kFontName1 size:20];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor orangeColor];
    self.navigationItem.titleView = label;
    
    if (self.currentMonAn) {
        NSString *imagePath = [[NSHomeDirectory() stringByAppendingString:@"/Documents/Images/"] stringByAppendingString:self.currentMonAn._image];
        label.text = [self.currentMonAn._ten capitalizedString];
        self.hinh.image = self.currentMonAn._image==nil ? [UIImage imageNamed:@"placeholder"] : [UIImage imageWithContentsOfFile:imagePath];
        self.nguyenlieu.text = self.currentMonAn._nguyenlieu;
        self.cachnau.text = self.currentMonAn._cachnau;
        self.link.text = self.currentMonAn._link;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UpdateViewController *update = (UpdateViewController *) segue.destinationViewController;
    update.isUpdate = YES;
}


@end
