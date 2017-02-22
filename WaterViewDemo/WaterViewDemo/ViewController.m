//
//  ViewController.m
//  WaterViewDemo
//
//  Created by 三英汇众 on 17/2/20.
//  Copyright © 2017年 三英汇众. All rights reserved.
//

#import "ViewController.h"
#import "WaterView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaterView *water2 = [[WaterView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200) scale:10 offset:M_PI strokeColor:[UIColor orangeColor]];
    water2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:water2];
    
    WaterView *waterView = [[WaterView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200) scale:6 offset:0 strokeColor:[UIColor redColor]];
    waterView.backgroundColor = [UIColor clearColor];
    waterView.alpha = 0.6;
     [self.view addSubview:waterView];
    
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 0, waterView.frame.size.width, 200);
    [waterView addSubview:label];
    
    CATextLayer *text = [CATextLayer new];
    text.frame = label.bounds;
    text.string = @"盗贼的围脖呢";
    text.contentsScale = [UIScreen mainScreen].scale;
    text.fontSize = 80;
    text.foregroundColor = [UIColor redColor].CGColor;
    [label.layer addSublayer:text];
    
    CATextLayer *textMask = [CATextLayer new];
    textMask.frame = label.bounds;
    textMask.foregroundColor = [UIColor blackColor].CGColor;
    textMask.contentsScale = [UIScreen mainScreen].scale;
    textMask.string = @"盗贼的围脖呢";
    textMask.fontSize = 80;
    [text addSublayer:textMask];
    
    CATextLayer *percentLayer = [CATextLayer new];
    percentLayer.string = @"30.0%";
    percentLayer.foregroundColor = [UIColor greenColor].CGColor;
    percentLayer.fontSize = 35;
    percentLayer.alignmentMode = @"center";
    percentLayer.frame = CGRectMake(0, 200, self.view.frame.size.width, 80);
    [waterView.layer addSublayer:percentLayer];
    

    waterView.pathBlock = ^(CGPathRef path, CGFloat height) {
        CAShapeLayer *shape = [CAShapeLayer layer];
        shape.path = path;
        textMask.mask = shape;
    
        percentLayer.string = [NSString stringWithFormat:@"%.1f%%", (100 - height /(70 + 10)* 100)];
    };
    
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:waterView selector:@selector(animate) userInfo:nil repeats:YES];
    
//    [NSTimer scheduledTimerWithTimeInterval:0.02 target:water2 selector:@selector(animate) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
