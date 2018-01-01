//
//  TextViewController.m
//  noNetwork
//
//  Created by mac on 2018/1/1.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网络监测";
    //初始化tableView
    [self initTableView];
}

#pragma mark ==================初始化tableView==================
- (void)initTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
}
#pragma mark ==================tableView代理方法==================
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.netStatus == 0) {
        
        return 0;
    }else {
        
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text  = @"网络监测";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

#pragma mark ==================网络状态的判断==================
-(void)monitorNetStateChanged:(NSInteger)netState {
    
    if (netState == 0) {
        
        //没有网络 展示没有网络界面
        [self addEmptyViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [self.tableView reloadData];
        
    }else{
        
        //有网
        [self removeEmptyView];
         [self.tableView reloadData];
    }
    
}
#pragma mark ==================点击没有网络界面==================
-(void)clickEmptyView {
   
     [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
