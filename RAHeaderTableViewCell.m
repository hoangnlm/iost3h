//
//  RAHeaderTableViewCell.m
//  iost3h
//
//  Created by Hoang on 9/11/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "RAHeaderTableViewCell.h"

@interface RAHeaderTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgHinh;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@end

@implementation RAHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.imgHinh.image = [UIImage imageNamed:_imgName];
//    self.lblTitle.text = _title;
//    self.lblAuthor.text = _author;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
