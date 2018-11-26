//
//  ViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/22.
//  Copyright © 2018 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.myView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.myView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //    [self animation];
    //    [self blockAnimation];
    //    [self keyframesAnimation];

    //    [self basicAnimation];
    //    [self keyFrameAnimation];
//    [self groupAnimation];
    [self gradient];
}

#pragma mark - 渐变色
- (void)gradient {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(100, 200, 200, 200);
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
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
}

#pragma mark - UIViewAnimation
- (void)animation {
    [UIView beginAnimations:@"Animation" context:nil];

    [UIView setAnimationDuration:3.0];
    [UIView setAnimationRepeatCount:3.0];

    self.myView.transform = CGAffineTransformMakeScale(1.5, 1.5);//缩放倍数
    self.myView.transform = CGAffineTransformMakeRotation(M_PI);//旋转角度

    [UIView commitAnimations];
}

#pragma mark - UIViewAnimationWithBlocks
- (void)blockAnimation {
    //    [UIView animateWithDuration:3.0 animations:^{
    //        [UIView setAnimationRepeatCount:MAXFLOAT];
    //        self.myView.backgroundColor = [UIColor greenColor];
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //    }];

    //    self.myView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.myView.layer.anchorPoint = CGPointMake(0, 0);
    [UIView animateWithDuration:3.0 animations:^{
        self.myView.transform = CGAffineTransformMakeRotation(M_PI);
    }];

    //    [UIView animateWithDuration:2.0 animations:^{
    //        [UIView setAnimationRepeatCount:2.0];
    //        self.myView.backgroundColor = [UIColor greenColor];
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //    } completion:^(BOOL finished) {
    //        NSLog(@"动画完成");
    //    }];
    //
    //    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
    //        [UIView setAnimationRepeatCount:2.0];
    //        self.myView.backgroundColor = [UIColor greenColor];
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //    } completion:^(BOOL finished) {
    //        NSLog(@"动画完成");
    //    }];
    //
    //    [UIView transitionFromView:self.view toView:self.myView duration:3.0 options:UIViewAnimationOptionCurveLinear completion:^(BOOL finished) {
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //        NSLog(@"Done");
    //    }];
    //
    //    [UIView transitionWithView:self.myView duration:4.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //    } completion:^(BOOL finished) {
    //        NSLog(@"动画完成");
    //    }];

    /**
     Damping 震动效果，范围0~1，数值越小震动效果越明显
     Velocity 初始速度，数值越大初始速度越快
     */
    //    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    //        [UIView setAnimationRepeatCount:2.0];
    //        self.myView.backgroundColor = [UIColor greenColor];
    //        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //    } completion:^(BOOL finished) {
    //        NSLog(@"动画完成");
    //    }];
}

#pragma mark - UIViewKeyframeAnimations
- (void)keyframesAnimation {
    [UIView animateKeyframesWithDuration:6.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            self.myView.transform = CGAffineTransformMakeScale(3.0, 3.0);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            self.myView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
    } completion:^(BOOL finished) {
        //        [self.myView removeFromSuperview];
        NSLog(@"动画完成");
    }];
}

#pragma mark - CABasicAnimation
- (void)basicAnimation {
    //位移
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    //    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    //    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 600)];
    //    animation.duration = 2.0;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    //    //动画的显示节奏 5种
    //    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //    [self.myView.layer addAnimation:animation forKey:@"positionAnimation"];

    //透明度
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //    animation.fromValue = [NSNumber numberWithFloat:1.0];
    //    animation.toValue = [NSNumber numberWithFloat:0.2];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"opacityAnimation"];

    //缩放
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    //    animation.toValue = [NSValue valueWithCGRect:CGRectMake(200, 500, 200, 300)];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"scaleAnimation"];

    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //    animation.toValue = [NSNumber numberWithFloat:2.0];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"scaleAnimation"];

    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    //    animation.toValue = [NSNumber numberWithFloat:2.0];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"scaleAnimation"];

    //旋转
    //transform.rotation.z = transform.rotation
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    animation.toValue = [NSNumber numberWithFloat:M_PI];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"rotateAnimation"];

    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    //绕着矢量（x,y,z）旋转
    //    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    //    animation.duration = 2.0;
    //    [self.myView.layer addAnimation:animation forKey:@"rotateAnimation"];


    //背景色
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
    animation.duration = 2.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.myView.layer addAnimation:animation forKey:@"backgroundAnimation"];
}

#pragma mark - CAKeyframeAnimation
- (void)keyFrameAnimation {
    //    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    animation.delegate = self;
    //
    //    //路径1
    ////    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 500, 200, 100)];
    ////    animation.path = path.CGPath;
    //    animation.duration = 3.0;
    //
    //    //路径2
    //    NSValue *value = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    //    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    //    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
    //    animation.values = [NSArray arrayWithObjects:value, value2, value3, nil];
    //    /**
    //         positionAnimation
    //         pathAnimation
    //         keyFrameAnimation
    //     */
    //    [self.myView.layer addAnimation:animation forKey:@"positionAnimation"];

    //transform.rotation.z = transform.rotation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value = [NSNumber numberWithFloat:-M_PI/180*4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
    animation.values = @[value, value2, value3];
    animation.duration = 0.5;
    animation.repeatCount = MAXFLOAT;
    [self.myView.layer addAnimation:animation forKey:@"shakeAnimation"];
}

#pragma mark - CAAnimationGroup
- (void)groupAnimation {
    CFTimeInterval currentTime = CACurrentMediaTime();

    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
    animation1.values = [NSArray arrayWithObjects:value, value2, value3, nil];
    //    animation1.beginTime = currentTime;
    animation1.duration = 2.0;
    //    animation1.fillMode = kCAFillModeForwards;
    //    animation1.removedOnCompletion = NO;
    [self.myView.layer addAnimation:animation1 forKey:@"1"];

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:0.8];
    animation2.toValue = [NSNumber numberWithFloat:2.0];
    //    animation2.beginTime = currentTime + 2.0;
    animation2.duration = 2.0;
    //    animation2.fillMode = kCAFillModeForwards;
    //    animation2.removedOnCompletion = NO;
    [self.myView.layer addAnimation:animation2 forKey:@"2"];

    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation3.toValue = [NSNumber numberWithFloat:M_PI * 4];
    //    animation3.beginTime = currentTime + 4.0;
    animation3.duration = 2.0;
    //    animation3.fillMode = kCAFillModeForwards;
    //    animation3.removedOnCompletion = NO;
    [self.myView.layer addAnimation:animation3 forKey:@"3"];

    //    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    //    groupAnimation.animations = [NSArray arrayWithObjects:animation1, animation2, animation3, nil];
    //    groupAnimation.duration = 5.0;
    //    [self.myView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始动画～");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"结束动画～");
}


@end
