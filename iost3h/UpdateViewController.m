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
    [Utils changeNavigationBarWithFontName:kFontName1 andTitle:self.currentMonAn ? @"Cập Nhật Món Ăn" : @"Thêm Món Ăn" fromContext:self];
    if (!self.currentMonAn) {
        self.currentMonAn = [MonAn new];
    }
    
    [Utils loadFloatLabelTextViewInView:self.viewTen withPlaceholder:@"  Tên món ăn" andContent:self.currentMonAn._ten];
    [Utils loadFloatLabelTextViewInView:self.viewMoTa withPlaceholder:@"  Mô tả" andContent:self.currentMonAn._mota];
    [Utils loadFloatLabelTextViewInView:self.viewNguyenLieu withPlaceholder:@"  Nguyên liệu" andContent:self.currentMonAn._nguyenlieu];
    [Utils loadFloatLabelTextViewInView:self.viewCachNau withPlaceholder:@"  Cách nấu" andContent:self.currentMonAn._cachnau];
    self.imgHinh.image = self.currentMonAn._image ? [Utils getImageWithFileName:self.currentMonAn._image] : [UIImage imageNamed:@"placeholder"];
    [Utils decorateImageView:self.imgHinh];
    [Utils loadFloatLabelTextViewInView:self.viewVideo withPlaceholder:@"  Video" andContent:self.currentMonAn._video];
    [Utils loadFloatLabelTextViewInView:self.viewLink withPlaceholder:@"  Link" andContent:self.currentMonAn._link];
}

- (IBAction)save:(id)sender {
    // Validate du lieu nhap vao
    if ([self validateInput]) {
        return;
    }
    UITextView *ten = (UITextView *) self.viewTen.subviews[0];
    UITextView *mota = (UITextView *) self.viewMoTa.subviews[0];
    UITextView *nguyenlieu = (UITextView *) self.viewNguyenLieu.subviews[0];
    UITextView *cachnau = (UITextView *) self.viewCachNau.subviews[0];
    UITextView *video = (UITextView *) self.viewVideo.subviews[0];
    UITextView *link = (UITextView *) self.viewLink.subviews[0];
    self.currentMonAn._ten = [ten.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.currentMonAn._mota = [mota.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.currentMonAn._nguyenlieu = [nguyenlieu.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.currentMonAn._cachnau = [cachnau.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // Luu ten hinh
    if (self.imgHinh.image == [UIImage imageNamed:@"placeholder"]) {
        self.currentMonAn._image = nil;
    }
    self.currentMonAn._video = [video.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.currentMonAn._link = [link.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // Luu vao db
    self.dao = [MonAnDAO new];
    [self.dao saveMonAn:self.currentMonAn];
    
    // Thong bao luu thanh cong xong quay ve man hinh chinh
    [Utils showInfoMessage:@"Đã lưu thông tin!" fromContext:self withOKHandler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)validateInput{
    BOOL result = NO;
    // Ten khong duoc bo trong
    UITextView *ten = (UITextView *)self.viewTen.subviews[0];
    if ([[ten.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [Utils showInfoMessage:@"Tên món ăn không được bỏ trống!" fromContext:self withOKHandler:nil];
        result = NO;
    }
    return result;
}
@end
