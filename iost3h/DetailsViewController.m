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
}

-(void)viewWillAppear:(BOOL)animated{
    [self initData];
}

#pragma mark Custom Functions

-(void)initData{
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    if (self.currentMonAn) {
        // Doi font cho navigation bar
        [Utils changeNavigationBarWithFontName:kFontName1 andTitle:[self.currentMonAn._ten capitalizedString] fromContext:self];
        self.imgHinh.image = self.currentMonAn._image==nil ? [UIImage imageNamed:@"placeholder"] : [Utils getImageWithFileName:self.currentMonAn._image];
        self.txtNguyenLieu.text = self.currentMonAn._nguyenlieu;
        self.txtCachNau.text = self.currentMonAn._cachnau;
        self.txtLink.text = self.currentMonAn._link;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UpdateViewController *update = (UpdateViewController *) segue.destinationViewController;
    update.currentMonAn = self.currentMonAn;
}


- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
