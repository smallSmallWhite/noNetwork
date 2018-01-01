//
//  EmptyView.h
//  ownerCarSide
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmptyViewDelegate <NSObject>

- (void)clickEmptyViewWithAction:(UIView *)sender;

@end

@interface EmptyView : UIView

@property (nonatomic,weak) id<EmptyViewDelegate>delegates;
-(instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic,strong) NSString *title;

@end
