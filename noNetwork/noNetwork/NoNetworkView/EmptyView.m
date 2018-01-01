//
//  EmptyView.m
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "EmptyView.h"
// 定义这个常量,就可以在使用Masonry不必总带着前缀 `mas_`:
#define MAS_SHORTHAND
// 定义这个常量,以支持在 Masonry 语法中自动将基本类型转换为 object 类型:
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"


@interface EmptyView()

//占位图片
@property (nonatomic,strong) UIImageView *placeImageView;
//加载失败文字
@property (nonatomic,strong) UILabel *loadFailedLabel;
//重新加载
@property (nonatomic,strong) UILabel *retryLoadlabel;


@end

@implementation EmptyView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self settingView];
    }
    return self;
}

#pragma mark ==================初始化设置==================
- (void)settingView {
    
    //占位图片
    _placeImageView = [[UIImageView alloc ]init];
    _placeImageView.image = [UIImage imageNamed:@"无网络"];
    [self addSubview:_placeImageView];
    
    //加载失败的文字
    _loadFailedLabel = [[UILabel alloc] init];
    _loadFailedLabel.text = @"网络已断开，请检查网络";
    _loadFailedLabel.textColor = [UIColor blackColor];
    _loadFailedLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_loadFailedLabel];
    
    //重新加载文字
    _retryLoadlabel = [[UILabel alloc] init];
    _retryLoadlabel.text = @"点击屏幕重新加载";
    _retryLoadlabel.font = [UIFont systemFontOfSize:14];
    _retryLoadlabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_retryLoadlabel];
    
    //布局
    [self layoutView];
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickACtion:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    
    
}
#pragma mark ==================view布局==================
- (void)layoutView {
    
    [_placeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self).offset(-80);
        make.width.equalTo(393/2);
        make.height.equalTo(258/2);
        make.centerX.equalTo(self).offset(0);
    }];
    
    [_loadFailedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_placeImageView.bottom).offset(0);
        make.width.equalTo(self.width);
        make.height.equalTo(21);
        make.centerX.equalTo(self).offset(0);
        
    }];
    
//    [_retryLoadlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(_loadFailedLabel.bottom).offset(10);
//        make.width.equalTo(self.width);
//        make.height.equalTo(21);
//        make.centerX.equalTo(self).offset(0);
//    }];
}
#pragma mark ==================手势回调==================
- (void)clickACtion:(UITapGestureRecognizer *)sender {
    
    if (self.delegates && [self.delegates respondsToSelector:@selector(clickEmptyViewWithAction:)]) {
        
        [self.delegates clickEmptyViewWithAction:sender.view];
    }
    
}
@end
