//
//  SideMenuViewController.m
//  iost3h
//
//  Created by Hoang on 9/10/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()<RATreeViewDelegate, RATreeViewDataSource>

@property (strong, nonatomic) NSArray *data;
@property (weak, nonatomic) RATreeView *treeView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    RATreeView *treeView = [[RATreeView alloc] initWithFrame:self.scrollView.bounds];
//    RATreeView *treeView = [RATreeView new];
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.treeFooterView = [UIView new];
    treeView.separatorStyle = RATreeViewCellSeparatorStyleNone;
    [treeView setBackgroundColor:[UIColor clearColor]];
    self.treeView = treeView;
    self.treeView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.scrollView addSubview:treeView];
    [self.treeView registerNib:[UINib nibWithNibName:NSStringFromClass([RATableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RATableViewCell class])];

    self.treeView.treeHeaderView = [self createHeaderView];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.treeView reloadData];
}

#pragma mark RATreeViewDataSource

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item{
    RADataObject *dataItem = item;
    NSInteger level = [self.treeView levelForCellForItem:item];

    RATableViewCell *cell = [self.treeView dequeueReusableCellWithIdentifier:NSStringFromClass([RATableViewCell class])];
    [cell setupWithTitle:dataItem.name andLevel:level];
    
    
    return cell;
}

- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item{
    if (item == nil) {
        return [self.data count];
    }
    
    RADataObject *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item{
    RADataObject *data = item;
    if (item == nil) {
        return [self.data objectAtIndex:index];
    }
    
    return data.children[index];
}

#pragma mark RATreeViewDelegate

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item{
    NSInteger level = [self.treeView levelForCellForItem:item];
    if (level==0) {
        return 38;
    }
    return 32;
}

-(void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item{
    NSInteger level = [self.treeView levelForCellForItem:item];
    if (level==1) {
        // Push to MonAnViewController with option
        
    }
}

#pragma mark Helpers

-(UIView *)createHeaderView{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.treeView.bounds.size.width, 90)];
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 8, 56, 56)];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(76, 8, self.treeView.bounds.size.width-76, 38)];
    UILabel *author = [[UILabel alloc] initWithFrame:CGRectMake(82, 48, self.treeView.bounds.size.width-82, 16)];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.treeView.bounds.size.width, 1)];
    
    header.backgroundColor = [UIColor clearColor];
    logo.image = [UIImage imageNamed:@"me"];
    [[logo layer] setMasksToBounds:YES];
    [[logo layer] setBorderColor:[[UIColor cyanColor] CGColor]];
    [[logo layer] setBorderWidth:2];
    [[logo layer] setCornerRadius:28];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    title.text = @"Cook Book Go";
    title.textColor = [UIColor cyanColor];
    title.backgroundColor = [UIColor clearColor];
    [title setFont:[UIFont fontWithName:@"Zapfino" size:16]];
    author.text = @"HoangNLM";
    author.textColor = [UIColor cyanColor];
    author.backgroundColor = [UIColor clearColor];
    [author setFont:[author.font fontWithSize:13]];
    line.backgroundColor = [UIColor cyanColor];

    [header addSubview:logo];
    [header addSubview:title];
    [header addSubview:author];
    [header addSubview:line];
    return  header;
}

-(void)loadData{
    NSMutableArray *children = [NSMutableArray new];
    for (NguyenLieu *item in [NguyenLieuDAO getListNguyenLieu]) {
        RADataObject *dataItem = [RADataObject dataObjectWithName:item._ten children:nil];
        [children addObject:dataItem];
    }
    RADataObject *nguyenlieu = [RADataObject dataObjectWithName:@"Nguyên liệu" children:children];
    
    [children removeAllObjects];
    for (CachNau *item in [CachNauDAO getListCachNau]) {
        RADataObject *dataItem = [RADataObject dataObjectWithName:item._ten children:nil];
        [children addObject:dataItem];
    }
    RADataObject *cachnau = [RADataObject dataObjectWithName:@"Cách nấu" children:children];
    
    [children removeAllObjects];
    for (DiaDiem *item in [DiaDiemDAO getListDiaDiem]) {
        RADataObject *dataItem = [RADataObject dataObjectWithName:item._ten children:nil];
        [children addObject:dataItem];
    }
    RADataObject *diadiem = [RADataObject dataObjectWithName:@"Địa điểm" children:children];
    
    [children removeAllObjects];
    for (ThoiDiem *item in [ThoiDiemDAO getListThoiDiem]) {
        RADataObject *dataItem = [RADataObject dataObjectWithName:item._ten children:nil];
        [children addObject:dataItem];
    }
    RADataObject *thoidiem = [RADataObject dataObjectWithName:@"Thời điểm" children:children];
    
    [children removeAllObjects];
    for (CheDo *item in [CheDoDAO getListCheDo]) {
        RADataObject *dataItem = [RADataObject dataObjectWithName:item._ten children:nil];
        [children addObject:dataItem];
    }
    RADataObject *chedo = [RADataObject dataObjectWithName:@"Chế độ" children:children];

    self.data = [NSArray arrayWithObjects:nguyenlieu, cachnau, diadiem, thoidiem, chedo, nil];
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
