//
//  SCCoreAnimationViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/27.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SCCoreAnimationViewController.h"

@interface SCCoreAnimationViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *myView;

@end

@implementation SCCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.myView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    [self basicAnimation];
//    [self keyFrameAnimation];
    [self groupAnimation];
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
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
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
//    //transform.rotation.z = transform.rotation
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
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.delegate = self;

    //路径1
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 500, 200, 100)];
    animation.path = path.CGPath;
    animation.duration = 3.0;

    //路径2
//    NSValue *value = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
//    animation.values = [NSArray arrayWithObjects:value, value2, value3, nil];
    /**
         positionAnimation
         pathAnimation
         keyFrameAnimation
     */
    [self.myView.layer addAnimation:animation forKey:@"positionAnimation"];

    //抖动
//    //transform.rotation.z = transform.rotation
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
//    NSValue *value = [NSNumber numberWithFloat:-M_PI/180*4];
//    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
//    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
//    animation.values = @[value, value2, value3];
//    animation.duration = 0.5;
//    animation.repeatCount = MAXFLOAT;
//    [self.myView.layer addAnimation:animation forKey:@"shakeAnimation"];
}

#pragma mark - CAAnimationGroup
- (void)groupAnimation {
//    CFTimeInterval currentTime = CACurrentMediaTime();

    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
    animation1.values = [NSArray arrayWithObjects:value, value2, value3, nil];
//    animation1.beginTime = currentTime;
//    animation1.duration = 2.0;
//    animation1.fillMode = kCAFillModeForwards;
//    animation1.removedOnCompletion = NO;
//    [self.myView.layer addAnimation:animation1 forKey:@"1"];

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = [NSNumber numberWithFloat:0.8];
    animation2.toValue = [NSNumber numberWithFloat:2.0];
//    animation2.beginTime = currentTime + 2.0;
//    animation2.duration = 2.0;
//    animation2.fillMode = kCAFillModeForwards;
//    animation2.removedOnCompletion = NO;
//    [self.myView.layer addAnimation:animation2 forKey:@"2"];

    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation3.toValue = [NSNumber numberWithFloat:M_PI * 4];
//    animation3.beginTime = currentTime + 4.0;
//    animation3.duration = 2.0;
//    animation3.fillMode = kCAFillModeForwards;
//    animation3.removedOnCompletion = NO;
//    [self.myView.layer addAnimation:animation3 forKey:@"3"];

    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.delegate = self;
    groupAnimation.animations = [NSArray arrayWithObjects:animation1, animation2, animation3, nil];
    groupAnimation.duration = 5.0;
    [self.myView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始动画～");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"结束动画～");
}

- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _myView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_myView];
    }
    return _myView;
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
