//
//  MyBooksController.m
//  FakeBear
//
//  Created by 郑先生 on 16/1/7.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "MyBooksController.h"
#import "HttpClient.h"
#import "Order.h"
#import "NSDictionary+NoNullObjectForKey.h"
#import "OrderSectionView.h"
#import "Course.h"
#import "NSDate+Helper.h"

static NSString *OrderSectionViewReuseIdentifier = @"OrderSectionViewReuseIdentifier";

@interface MyBooksController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MyBooksController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[OrderSectionView class] forHeaderFooterViewReuseIdentifier:OrderSectionViewReuseIdentifier];
    
    [[HttpClient sharedInstance] GET:@"/client/user/orders/expired?page=1" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self setupWithResponse:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"---error: %@", error);
    }];
}

- (void)setupWithResponse:(NSDictionary *)responseObject
{
    for (NSDictionary *dict in [[responseObject dictForKey:@"data"] arrayForKey:@"orders"]) {
        [self.dataArray addObject:[[Order alloc] initWithDictionary:dict]];
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark - UITableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *UITableViewCellReuseIdentifier = @"UITableViewCellReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellReuseIdentifier];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    OrderSectionView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:OrderSectionViewReuseIdentifier];
    sectionView.flag = (section == 0);
    if (section < self.dataArray.count) {
        sectionView.textLabel.text = [[self.dataArray[section] course].start stringWithFormat:@"MM月dd日"];
    }
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 80;
    }
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

#pragma mark - getters and setters

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
