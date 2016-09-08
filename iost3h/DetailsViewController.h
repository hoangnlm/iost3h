//
//  DetailsViewController.h
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *hinh;
@property (weak, nonatomic) IBOutlet UILabel *nguyenlieu;
@property (weak, nonatomic) IBOutlet UILabel *cachnau;
@property (weak, nonatomic) IBOutlet UIView *video;
@property (weak, nonatomic) IBOutlet UILabel *link;
@property(nonatomic)MonAn *currentMonAn;
@end
