//
//  XSWBaseViewController.h
//  noNetwork
//
//  Created by mac on 2018/1/1.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XSWNetWorkStatus) {
    
    XSWNetWorkStatusNoInternet,//没有网络
    XSWNetWorkStatusFlow,//流量连接
    XSWNetWorkStatusWifi //wifi链接
};

@interface XSWBaseViewController : UIViewController

//网络状态
@property (nonatomic,assign) XSWNetWorkStatus netStatus;

//添加没有网络界面
- (void)addEmptyViewWithFrame:(CGRect)frame;

//移除没有网络界面
- (void)removeEmptyView;

//点击空白视图回调
- (void)clickEmptyView;

//监测网络状态的方法
- (void)monitorNetStateChanged:(NSInteger)netState;


@end
