//
//  SCEmitterAnimationViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/27.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SCEmitterAnimationViewController.h"

@interface SCEmitterAnimationViewController ()

@end

@implementation SCEmitterAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self gradient];
    [self emitter];
}

//渐变色
- (void)gradient {
    /***********************************

  (0, 0)              (1, 0)
     |------------------|
     |                  |
     |                  |
     |                  |
     |                  |
     |                  |
     |                  |
     |                  |
     |                  |
     |------------------|
  (0, 1)              (1, 1)

     ***********************************/

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0,
                                     kStatusHeight + kNavigationHeight,
                                     kScreenWidth,
                                     kScreenHeight - kStatusHeight - kNavigationHeight);
    [self.view.layer addSublayer:gradientLayer];

    UIColor *color1 = [UIColor yellowColor];
    UIColor *color2 = [UIColor greenColor];
    UIColor *color3 = [UIColor orangeColor];
    UIColor *color4 = [UIColor brownColor];

    gradientLayer.colors = @[(__bridge id)color1.CGColor,
                             (__bridge id)color2.CGColor,
                             (__bridge id)color3.CGColor,
                             (__bridge id)color4.CGColor];
    gradientLayer.locations = @[@(0.2),
                                @(0.6),
                                @(0.8),
                                @(0.9)];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 0);
}

//粒子动画
- (void)emitter {
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"christmas_hat"].CGImage;

    cell.birthRate = 2.0;

    cell.lifetime = 5.0;
    cell.lifetimeRange = 1.0;

//    cell.alphaSpeed = -0.2;
//    cell.alphaRange = 0.5;

    cell.velocity = 10;
    cell.velocityRange = 100;

//    cell.emissionRange = M_PI * 2;

//    cell.color = [UIColor redColor].CGColor;

    cell.scale = 0.7;
    cell.scaleRange = 0.8;

    cell.emissionLongitude = M_PI;
    cell.yAcceleration = 70.0;

    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.view.bounds;

    //发射位置
    emitterLayer.emitterPosition = CGPointMake(CGRectGetMidX(self.view.frame), kStatusHeight + kNavigationHeight + 20);
    //粒子产生系数，默认1
//    emitterLayer.birthRate = 1;
//    //发射形状
//    emitterLayer.emitterShape = kCAEmitterLayerPoints;
//    //发射模式
//    emitterLayer.emitterMode = kCAEmitterLayerVolume;
//    //渲染模式
//    emitterLayer.renderMode = kCAEmitterLayerUnordered;

    emitterLayer.emitterCells = @[cell];
    [self.view.layer addSublayer:emitterLayer];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
