//
//  SCShineButtonViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/30.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SCShineButtonViewController.h"

@interface SCShineButtonViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@property (nonatomic, strong)  UIButton *wishButton;

@end

@implementation SCShineButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.button];
    [self setupWishButton];
}

- (void)clickAction {
    //button缩放
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation1.duration = 0.5;
    NSValue *value1 = [NSNumber numberWithFloat:0.5];
    NSValue *value2 = [NSNumber numberWithFloat:1.5];
    animation1.values = [NSArray arrayWithObjects:value1, value2, nil];
    [self.button.layer addAnimation:animation1 forKey:@"transform"];

    //圆环缩放
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation2.delegate = self;
    animation2.duration = 0.5;
    NSValue *value3 = [NSNumber numberWithFloat:0.5];
    NSValue *value4 = [NSNumber numberWithFloat:3.0];
    animation2.values = [NSArray arrayWithObjects:value3, value4, nil];
    [self.circleLayer addAnimation:animation2 forKey:@"transform"];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //粒子动画
        [self emitter];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.emitterLayer removeFromSuperlayer];
        self.button.userInteractionEnabled = NO;
        [self.button setBackgroundImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateNormal];
    });
}

//粒子动画
- (void)emitter {
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"point"].CGImage;
    cell.birthRate = 1000;
    cell.lifetime = 1.0;
    cell.lifetimeRange = 0.3;
    cell.alphaSpeed = 1.0;
    cell.alphaRange = 1;
    cell.velocity = 40.0;
    cell.velocityRange = 10.0;
    cell.scale = 0.1;
    cell.scaleRange = 0.2;

    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer = emitterLayer;
    emitterLayer.emitterCells = @[cell];
    emitterLayer.frame = self.view.bounds;
    emitterLayer.emitterPosition = CGPointMake(20, 20);
    emitterLayer.emitterShape = kCAEmitterLayerCircle;
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterSize = CGSizeMake(40, 0);
    emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    emitterLayer.masksToBounds = NO;
    emitterLayer.zPosition = -1;
    [self.button.layer addSublayer:emitterLayer];
}

#pragma mark - CAAnimationDelegate
//- (void)animationDidStart:(CAAnimation *)anim {
//    [self.view.layer addSublayer:self.button.layer];
//}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self.circleLayer removeFromSuperlayer];
}

#pragma mark - lazy load
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(100, 300, 40, 40);
        [_button setBackgroundImage:[UIImage imageNamed:@"like_normal"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:_button];
    }
    return _button;
}

- (CAShapeLayer *)circleLayer {
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.frame = CGRectMake(10, 10, 20, 20);
        _circleLayer.borderColor = [UIColor redColor].CGColor;
        _circleLayer.borderWidth = 1.0;
        _circleLayer.cornerRadius = _circleLayer.frame.size.width / 2;
        [self.button.layer addSublayer:_circleLayer];
    }
    return _circleLayer;
}

- (void)setupWishButton {
    NSArray *array = @[@{@"title": @"圣"},
                       @{@"title": @"诞"},
                       @{@"title": @"快"},
                       @{@"title": @"乐"}];

    for (int i = 0; i < 4; i++) {
        UIButton *wishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.wishButton = wishButton;
        wishButton.tag = i;
        wishButton.backgroundColor = [UIColor redColor];
        wishButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [wishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:wishButton];

        NSDictionary *dic = array[i];
        wishButton.frame = CGRectMake(i * 50 + 100, -100, 40, 40);
        [wishButton setTitle:dic[@"title"] forState:UIControlStateNormal];

        wishButton.layer.cornerRadius = wishButton.frame.size.width / 2;
        wishButton.clipsToBounds = YES;
    }
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
