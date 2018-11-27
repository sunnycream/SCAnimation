//
//  SCViewAnimationViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/27.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SCViewAnimationViewController.h"

@interface SCViewAnimationViewController ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIView *yourView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation SCViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.myView];
//    [self.view addSubview:self.yourView];
//    [self.view addSubview:self.label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self animation];
//    [self blockAnimation];
    [self keyframesAnimation];
}

#pragma mark - UIViewAnimation
- (void)animation {
    [UIView beginAnimations:@"Animation" context:nil];

    //动画时长
    [UIView setAnimationDuration:2.0];
    //重复次数
    [UIView setAnimationRepeatCount:MAXFLOAT];
    //缩放倍数
    self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    //旋转角度
    self.myView.transform = CGAffineTransformMakeRotation(M_PI);

    [UIView commitAnimations];
}

#pragma mark - UIViewAnimationWithBlocks
- (void)blockAnimation {
    //背景色
//    [UIView animateWithDuration:2.0 animations:^{
//        [UIView setAnimationRepeatCount:3.0];
//        self.myView.backgroundColor = [UIColor greenColor];
//    }];

    //背景色 completion
//    [UIView animateWithDuration:2.0 animations:^{
//        [UIView setAnimationRepeatCount:3.0];
//        self.myView.backgroundColor = [UIColor greenColor];
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完成");
//    }];

    //背景色 delay options completion
//    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//        [UIView setAnimationRepeatCount:3.0];
//        self.myView.backgroundColor = [UIColor greenColor];
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完成");
//    }];

    //旋转
////    self.myView.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    self.myView.layer.anchorPoint = CGPointMake(0, 0);
//    [UIView animateWithDuration:3.0 animations:^{
//        self.myView.transform = CGAffineTransformMakeRotation(M_PI);
//    }];

#warning 反转
    //消失？反转
//    [UIView transitionFromView:self.label toView:self.myView duration:3.0 options:UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
//        self.myView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        NSLog(@"动画完成");
//    }];

//    [UIView transitionWithView:self.label duration:4.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
//    } completion:^(BOOL finished) {
//        NSLog(@"动画完成");
//    }];

    /**
     Damping 震动效果，范围0~1，数值越小震动效果越明显
     Velocity 初始速度，数值越大初始速度越快
     */
    //Spring动画
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseIn animations:^{

        [UIView setAnimationRepeatCount:2.0];
        self.myView.backgroundColor = [UIColor greenColor];
        self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);

    } completion:^(BOOL finished) {
        NSLog(@"动画完成");
    }];
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
            [self.myView removeFromSuperview];
        NSLog(@"动画完成");
    }];
}


- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _myView.backgroundColor = [UIColor redColor];
    }
    return _myView;
}

- (UIView *)yourView {
    if (!_yourView) {
        _yourView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _yourView.backgroundColor = [UIColor blackColor];
    }
    return _myView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, kScreenWidth - 40, 40)];
        _label.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
        _label.text = @"我快要消失了……";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
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
