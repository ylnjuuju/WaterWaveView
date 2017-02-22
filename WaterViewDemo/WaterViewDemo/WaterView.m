//
//  WaterView.m
//  WaterViewDemo
//
//  Created by 三英汇众 on 17/2/20.
//  Copyright © 2017年 三英汇众. All rights reserved.
//

#import "WaterView.h"

@implementation WaterView
{
    CGFloat range;
    CGFloat yOffset;
    BOOL direction;
    UIColor *strokeColor;
    
    CGFloat natureHeight;
}



- (instancetype)initWithFrame:(CGRect)frame scale:(CGFloat)scale offset:(CGFloat)offset strokeColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    range = scale;
    yOffset = offset;
    
    strokeColor = color;
    
    natureHeight = 70;
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, strokeColor.CGColor);
    
    CGPathMoveToPoint(path, nil, 0, 0);
    for (int i = 0; i < self.frame.size.width; i ++) {
        CGFloat y = range * sin(i / (M_PI * 10) + yOffset * M_PI_4 ) + natureHeight;
        CGPathAddLineToPoint(path, nil, (CGFloat)i, y);
    }
    CGPathAddLineToPoint(path, nil, self.frame.size.width, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, 0);
//    CGPathAddPath(path, <#const CGAffineTransform * _Nullable m#>, <#CGPathRef  _Nullable path2#>)
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
 
    if (_pathBlock) {
        _pathBlock(path, natureHeight);
    }
    
    CGPathRelease(path);
}


- (void)animate {
    
//    if (direction) {
//        range += 0.01;
//    } else range -= 0.01;
//    
//    if (range <= 5) {
//        direction = YES;
//    }
//    if (range >= 5.5) {
//        direction = NO;
//    }
    yOffset += 0.2;
   
    if (!direction) {
        natureHeight -= 0.1;
    } else {
        natureHeight += 0.1;
    }
    
    
    if (natureHeight <= range) {
        direction = YES;
    }
    if (natureHeight >= 69) {
        direction = NO;
    }
    
    [self setNeedsDisplay];
}

@end
