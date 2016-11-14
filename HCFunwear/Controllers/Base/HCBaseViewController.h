//
//  HCBaseViewController.h
//  HCFunwear
//
//  Created by 刘海川 on 16/8/29.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCBaseViewModel.h"

@interface HCBaseViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong, readonly) HCBaseViewModel *viewModel;

- (instancetype)initWithViewModel:(HCBaseViewModel *)viewModel;

- (void)bindViewModel;

@end
