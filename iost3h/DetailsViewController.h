//
//  DetailsViewController.h
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "UpdateViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgHinh;
@property (weak, nonatomic) IBOutlet UILabel *txtNguyenLieu;
@property (weak, nonatomic) IBOutlet UILabel *txtCachNau;
@property (weak, nonatomic) IBOutlet UIView *video;
@property (weak, nonatomic) IBOutlet UILabel *txtLink;
@property(nonatomic)MonAn *currentMonAn;
- (IBAction)back:(id)sender;
@end