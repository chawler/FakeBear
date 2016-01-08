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
#import "OrderCourseCell.h"
#import "OrderTableHeader.h"
#import "ActionHelper.h"
#import "QRVerifyController.h"

static NSString *OrderSectionViewReuseIdentifier = @"OrderSectionViewReuseIdentifier";

@interface MyBooksController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) OrderTableHeader *tableHeader;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) Order *inComingOrder;

@end

@implementation MyBooksController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[OrderSectionView class] forHeaderFooterViewReuseIdentifier:OrderSectionViewReuseIdentifier];
    
    [[HttpClient sharedInstance] GET:@"/client/user/orders/expired" parameters:@{@"page": @2} success:^(NSURLSessionDataTask *task, id responseObject) {
        [self setupWithResponse:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"---error: %@", error);
    }];
    
    [ActionHelper sharedInstance].onCheckin = ^(Order *order) {
        QRVerifyController *qrvc = [[QRVerifyController alloc] initWithOrder:order];
        [self.navigationController pushViewController:qrvc animated:YES];
    };
    [ActionHelper sharedInstance].onInvite = ^(Order *order) {
        order.status = !order.status;
        self.tableView.tableHeaderView = [self newHeaderWithOrder:order];
    };
}

- (void)setInComingOrder:(Order *)inComingOrder
{
    inComingOrder.status = NO;
    _inComingOrder = inComingOrder;
}

- (void)setupWithResponse:(NSDictionary *)responseObject
{
    for (NSDictionary *dict in [[responseObject dictForKey:@"data"] arrayForKey:@"orders"]) {
        [self.dataArray addObject:[[Order alloc] initWithDictionary:dict]];
    }
    self.inComingOrder = [self.dataArray.firstObject copy];
    self.tableView.tableHeaderView = [self newHeaderWithOrder:self.inComingOrder];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OrderTableHeader *)newHeaderWithOrder:(Order *)order
{
    OrderTableHeader *header = [[OrderTableHeader alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 200)];
    [header layoutSubviewsWithData:order];
    return header;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *UITableViewCellReuseIdentifier = @"UITableViewCellReuseIdentifier";
    OrderCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[OrderCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UITableViewCellReuseIdentifier];
    }
    if (indexPath.section < self.dataArray.count) {
        [cell layoutSubviewsWithData:self.dataArray[indexPath.section]];
    }
    return cell;
}

#pragma mark - UITableView Delegate

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
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark - getters and setters

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (OrderTableHeader *)tableHeader
{
    if (!_tableHeader) {
        _tableHeader = [[OrderTableHeader alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 200)];
    }
    return _tableHeader;
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
