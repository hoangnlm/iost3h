//
//  MonAnViewController.h
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MonAnTableViewCell.h"
#import "MonAnDAO.h"
#import "DetailsViewController.h"

@interface MonAnViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic) MonAnDAO *dao;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic)NSMutableArray *listMonAn;

@end
