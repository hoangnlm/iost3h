//
//  RATableViewCell.m
//  iost3h
//
//  Created by Hoang on 9/11/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "RATableViewCell.h"

@interface RATableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgMenuItem;
@property (weak, nonatomic) IBOutlet UILabel *lblMenuItem;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLeft;

@end

@implementation RATableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWithTitle:(NSString *)title andLevel:(NSInteger)level{
    // Them empty item cuoi de them space neu muon
    if (level==1 && [title isEqualToString:@""]) {
        self.lblMenuItem.text = nil;
        self.imgMenuItem.image = nil;
        return;
    }
    
    self.lblMenuItem.text = title;
    
    if (level==0) {
        self.imgMenuItem.image = [UIImage imageNamed:@"menu_item_1"];
        [self.lblMenuItem setFont:[UIFont fontWithName:@"Ariston" size:20]];
        self.constraintLeft.constant = 16;
    }
    if(level==1) {
        self.imgMenuItem.image = [UIImage imageNamed:@"menu_item_2"];
        [self.lblMenuItem setFont:[UIFont fontWithName:@"Arial" size:14]];
        self.constraintLeft.constant = 40;
    }
}

@end
