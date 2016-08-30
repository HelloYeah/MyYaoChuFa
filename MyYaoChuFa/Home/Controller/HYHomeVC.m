//
//  HYHomeVC.m
//  MyYaoChuFa
//
//  Created by Sekorm on 16/8/25.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HYHomeVC.h"
//#import "UIViewController+NavBarHidden.h"
#import "HYViewController.h"
@interface HYHomeVC () <UITableViewDataSource>
@property (nonatomic,weak) UITableView  * tableView;
@end

@implementation HYHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setKeyScrollView:self.tableView scrolOffsetY:600 options:HYHidenControlOptionLeft | HYHidenControlOptionTitle];
    //设置tableView的头部视图
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 250)];
    imageView.image = [UIImage imageNamed:@"2.jpg"];
    self.tableView.tableHeaderView = imageView;

    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"LaunchImage-700"] forBarMetrics:UIBarMetricsDefault];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
   
    [super viewDidAppear:animated];
//    [self setInViewWillAppear];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
//    [self setInViewWillDisappear];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView.dataSource = self;
        _tableView = tableView;
    }
    return _tableView;
}

@end
