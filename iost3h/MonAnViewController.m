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
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController) {
        [self.sideMenuButton setTarget:self.revealViewController];
        [self.sideMenuButton setAction:@selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    self.listMonAn = [self.dao getListMonAn];
    [self.tableView reloadData];
}

#pragma mark Custom Functions

-(void)initData{
    self.dao = [MonAnDAO new];
    // Doi font cho navigation bar
    [Utils changeNavigationBarWithFontName:kFontName1 andTitle:@"Danh Sách Món Ăn" fromContext:self];
}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listMonAn.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MonAnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    MonAn *monan = self.listMonAn[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lbTen.text = [monan._ten capitalizedString];
    cell.ivHinh.image = monan._image==nil ? [UIImage imageNamed:@"placeholder"] : [Utils getImageWithFileName:monan._image];
//    [cell.ivHinh sd_setImageWithURL:[NSURL fileURLWithPath:imagePath] placeholderImage:[UIImage imageNamed:@"placeholder"]];

    return cell;
}

#pragma mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    detail.currentMonAn = self.listMonAn[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete mon an khoi db
        [self.dao deleteMonAn:self.listMonAn[indexPath.row]];
        [self.listMonAn removeObjectAtIndex:indexPath.row];
        // Delete khoi UI
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Xóa";
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

- (IBAction)search:(id)sender {
}
@end
