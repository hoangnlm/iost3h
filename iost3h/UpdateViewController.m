//
//  UpdateViewController.m
//  iost3h
//
//  Created by Hoang on 9/8/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

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
    label.text = self.isUpdate ? @"Cập Nhật Món Ăn" : @"Thêm Món Ăn";
    self.navigationItem.titleView = label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
