//
//  DIEViewController.m
//  布丁动画
//
//  Created by apple on 15/9/30.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEViewController.h"

@interface DIEViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DIEViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.backgroundColor = [UIColor yellowColor];
    
    [_tableView registerClass:[DIEViewControllerCellTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}


#pragma mark DataSource method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DIEViewControllerCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.avatorImageView sd_setImageWithURL:[NSURL URLWithString:@"http://passport.ixpub.net/data/avatar/010/41/59/85_avatar_middle.jpg"] placeholderImage:[UIImage imageNamed:@"apple.png"]];
    cell.titleLabel.text = @"大标题";
    cell.subTiteLabel.text = @"副标题";
    cell.statusLabel.text = @"状态标题";
    return cell;
}

#pragma mark delegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}





@end