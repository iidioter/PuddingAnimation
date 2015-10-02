//
//  DIEAnimeViewController.m
//  布丁动画
//
//  Created by cq on 15/10/1.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEAnimeViewController.h"
#import "DIECategoryCell.h"
#import "AnimaTableViewCell.h"
#import "DIENotificationConfig.h"
#import "DIEDataManeager.h"
#import "UIImageView+WebCache.h"
                                        //UI表格视图数据来源  UI表格标签控制器委托
@interface DIEAnimeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

//分类详情页面
@implementation DIEAnimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"player_btn_back"] style:UIBarButtonItemStyleDone target:self action:@selector(popBackClicked:)];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[AnimaTableViewCell class] forCellReuseIdentifier:@"AnimaTableViewCell"];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    DIEAddObserver(self, @selector(animeUpdated:), kDIEAnimeUpdateNotif,nil);
    [[DIEDataManeager sharedManager] updateAnimeWithCategoryTd:_categoryId];
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

- (void)popBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//动漫更新重新加载数据
- (void)animeUpdated:(id)sender
{
    [_tableView reloadData];
}



#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [DIEDataManeager sharedManager].animeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimaTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"AnimaTableViewCell" forIndexPath:indexPath];
    DIEAnimeModel *model = [DIEDataManeager sharedManager].animeArray[indexPath.row];
    
    [cell.animeImageView sd_setImageWithURL:model.url placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.nameLabel.text = model.name;
    cell.categoryNamesLabel.text = [model.categoryNames componentsJoinedByString:@" / "];
    cell.updatedLabel.text = [NSString stringWithFormat:@"更新至第%ld话",model.onairEpNumber];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end