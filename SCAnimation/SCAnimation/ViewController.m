//
//  ViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/22.
//  Copyright © 2018 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self animation];
    [self blockAnimation];
//    [self keyframesAnimation];
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



@end
