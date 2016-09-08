//
//  MonAnViewController.m
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "MonAnViewController.h"

@interface MonAnViewController ()

@end

@implementation MonAnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

#pragma mark Custom Functions

-(void)initData{
    self.dao = [MonAnDAO new];
    self.listMonAn = [self.dao getListMonAn];
//    NSLog(@"mang: %@", self.listMonAn);
    

    // Chinh mau navigation bar cho trong suot
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    // Doi font cho navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 35)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:kFontName1 size:20];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor orangeColor];
    label.text = @"Danh Sách Món Ăn";
    self.navigationItem.titleView = label;
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listMonAn.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MonAnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    MonAn *monan = self.listMonAn[indexPath.row];
    NSString *imagePath = [[NSHomeDirectory() stringByAppendingString:@"/Documents/Images/"] stringByAppendingString:monan._image];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lbTen.text = [monan._ten capitalizedString];
    cell.ivHinh.image = monan._image==nil ? [UIImage imageNamed:@"placeholder"] : [UIImage imageWithContentsOfFile:imagePath];
//    [cell.ivHinh sd_setImageWithURL:[NSURL fileURLWithPath:imagePath] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    return cell;
}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    detail.currentMonAn = self.listMonAn[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
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
