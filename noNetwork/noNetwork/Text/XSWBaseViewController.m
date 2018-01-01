//
//  XSWBaseViewController.m
//  noNetwork
//
//  Created by mac on 2018/1/1.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "XSWBaseViewController.h"
//网络监测第三方
#import "RealReachability.h"
#import "EmptyView.h"

@interface XSWBaseViewController ()<EmptyViewDelegate>

@end

@implementation XSWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RealReachability *reachability = [RealReachability sharedInstance];
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    switch (status) {
        case 0:
        {
            _netStatus = XSWNetWorkStatusNoInternet;
        }
            break;
        case 1:{
            
            _netStatus = XSWNetWorkStatusFlow;
        }
            break;
        case 2:{
            
            _netStatus = XSWNetWorkStatusWifi;
        }
            break;
        default:
            break;
    }
    //监听网络状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];
}

#pragma mark ==================监听事件的回调==================
- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    switch (status) {
        case 0:
        {
            _netStatus = XSWNetWorkStatusNoInternet;
            [self monitorNetStateChanged:0];
        }
            break;
        case 1:{
            
            _netStatus = XSWNetWorkStatusFlow;
            [self monitorNetStateChanged:1];
        }
            break;
        case 2:{
            
            _netStatus = XSWNetWorkStatusWifi;
            [self monitorNetStateChanged:2];
        }
            break;
        default:
            break;
    }
}
//添加没有网络界面
- (void)addEmptyViewWithFrame:(CGRect)frame {
    
    EmptyView *emptyView = [[EmptyView alloc] initWithFrame:frame];
    emptyView.delegates = self;
    [self.view addSubview:emptyView];
}
//无网络页面的回调事件
- (void)clickEmptyViewWithAction:(UIView *)sender {
    
    [self clickEmptyView];
}
-(void)clickEmptyView {
    
    //子类实现
}
//移除没有网络界面
- (void)removeEmptyView {
    
    for (UIView *view in self.view.subviews) {
        
        if ([view isKindOfClass:[EmptyView class]]) {
            
            [view removeFromSuperview];
        }
    }
}
#pragma mark ==================网络状态改变==================
-(void)monitorNetStateChanged:(NSInteger)netState {
    
    //子类实现
}
#pragma mark ==================移除通知==================
-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
