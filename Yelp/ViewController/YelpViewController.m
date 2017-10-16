//
//  YelpViewController.m
//  Yelp
//
//  Created by 杨以皓 on 10/12/17.
//  Copyright © 2017 yyh. All rights reserved.
//


#import "YelpViewController.h"
#import "YelpDataModel.h"
#import "YelpNetworking.h"
#import "YelpTableViewCell.h"

static NSString * const YelpTableViewCellIdenitfier = @"YelpTableViewCell";
@import MapKit;

@interface YelpViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic, copy) NSArray<YelpDataModel *> *dataModels;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation YelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self loadYelpData];
}

- (void)setupUI
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    
    // Setup search bar
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.searchBar.tintColor = [UIColor lightGrayColor];
    self.navigationItem.titleView = self.searchBar;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapSettings)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YelpTableViewCell" bundle:nil] forCellReuseIdentifier:YelpTableViewCellIdenitfier];
}

- (void)loadYelpData
{
    __weak typeof(self) weakSelf = self;
    CLLocation *location = [[CLLocation alloc] initWithLatitude:37.3263625 longitude:-122.027210];
    [[YelpNetworking sharedInstance] fetchRestaurantsBasedOnLocation:location term:@"restaurant" completionBlock:^(NSArray<YelpDataModel *> *dataModelArray) {
        weakSelf.dataModels = dataModelArray;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    }];
}

- (void)didTapSettings
{
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataModels count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YelpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YelpTableViewCell" forIndexPath:indexPath];
    [cell updateBasedOnDataModel:self.dataModels[indexPath.row]];
    return cell;
}

@end
