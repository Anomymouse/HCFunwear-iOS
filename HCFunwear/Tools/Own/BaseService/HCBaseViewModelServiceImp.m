//
//  HCBaseViewModelServiceImp.m
//  HCFunwear
//
//  Created by 刘海川 on 16/11/14.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCBaseViewModelServiceImp.h"
#import "HCTabBarViewModel.h"

@implementation HCBaseViewModelServiceImp

/*
    子类重写该方法
    如果有统一的过场动画效果在这里定义，子类调用 super 。
 */

- (void)pushViewModel:(HCBaseViewModel *)viewModel animated:(BOOL)animated {
    HCBaseViewController *viewController = [[HCNavigationControllerStack sharedInstance] viewControllerFromRouterWithViewModel:viewModel];
    
    if ([viewModel isKindOfClass:HCTabBarViewModel.class]) {
        [[HCNavigationControllerStack sharedInstance].topNavigationController pushViewController:[GlobalContext ShareInstance].mainTabBarController animated:YES];
    }
    else {
        [[HCNavigationControllerStack sharedInstance].topNavigationController pushViewController:viewController animated:YES];
    }
}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(HCBaseViewModel *)viewModel animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion {}

- (void)resetRootViewModel:(HCBaseViewModel *)viewModel {}

@end
