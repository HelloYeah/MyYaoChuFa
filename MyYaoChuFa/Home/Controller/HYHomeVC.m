//
//  HYHomeVC.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/25.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYHomeVC.h"
#import "HYTableViewSectionHeader.h"
#import "HYScenicTableViewCell.h"

@interface HYHomeVC () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView  * tableView;
@end

@implementation HYHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HYScenicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYScenicTableViewCell" forIndexPath:indexPath];
    cell.title = @"深圳+东西冲啊，只要100块！！！！";
    cell.imageName = @"2.jpg";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HYTableViewSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HYTableViewSectionHeader"];
    header.titleLabel.text = section % 2 ? @"植树节清明节我来了" : @"发现专题";
    header.subTitleLabel.text = @"|  汇集超级好玩的景区,城市";
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 35 ;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //设置tableView的头部视图
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 250)];
        imageView.image = [UIImage imageNamed:@"2.jpg"];
        _tableView.tableHeaderView = imageView;
        [_tableView registerClass:[HYTableViewSectionHeader class] forHeaderFooterViewReuseIdentifier:@"HYTableViewSectionHeader"];
        [_tableView registerClass:[HYScenicTableViewCell class] forCellReuseIdentifier:@"HYScenicTableViewCell"];
    }
    return _tableView;
}

@end
