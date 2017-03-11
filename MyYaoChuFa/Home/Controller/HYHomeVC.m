//
//  HYHomeVC.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/25.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYHomeVC.h"

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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test" ];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    cell.textLabel.text = @"test";
    
    return cell;
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
    }
    return _tableView;
}

@end
