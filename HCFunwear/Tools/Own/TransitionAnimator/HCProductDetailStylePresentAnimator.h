//
//  HCProductDetailStylePresentAnimator.h
//  HCFunwear
//
//  Created by 刘海川 on 16/10/25.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HCBaseTransitionAnimator.h"

@interface HCProductDetailStylePresentAnimator : HCBaseTransitionAnimator

@property (nonatomic, copy) void(^dismissBlock)();

@end
