//
//  WaterView.h
//  WaterViewDemo
//
//  Created by 三英汇众 on 17/2/20.
//  Copyright © 2017年 三英汇众. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterView : UIView

@property (nonatomic, copy) void (^pathBlock)(CGPathRef path, CGFloat natureHeight);

- (instancetype)initWithFrame:(CGRect)frame scale:(CGFloat)scale offset:(CGFloat)offset strokeColor:(UIColor *)color;

- (void)animate;

@end
