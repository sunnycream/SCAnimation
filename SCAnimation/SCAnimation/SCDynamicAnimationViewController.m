//
//  SCDynamicAnimationViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/29.
//  Copyright © 2018 admin. All rights reserved.
//

#import "SCDynamicAnimationViewController.h"

@interface SCDynamicAnimationViewController ()<UIDynamicAnimatorDelegate>

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIView *yourView;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation SCDynamicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.myView];
    [self.view addSubview:self.yourView];
    [self buttons];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator.delegate = self;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.myView addGestureRecognizer:pan];
}


//start
- (void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator {
    NSLog(@"start--------------");
}

//stop
- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator {
     NSLog(@"stop--------------");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gravity];
//    [self collision];
    //attachment
//    [self push];
//    [self snap];
//    [self dynamicItem];
}

//重力行为
- (void)gravity {
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.myView]];

    /*      (dx, dy)

            top:    (0, -1)
            left:   (-1, 0)
            bottom: (0, 1)
            right:  (1, 0)
     */
    gravity.gravityDirection = CGVectorMake(0, 1);
    gravity.magnitude = 0.5;
    [self.animator addBehavior:gravity];
}

- (void)attachment {
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.myView attachedToAnchor:CGPointMake(150, 600)];
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.myView offsetFromCenter:UIOffsetMake(25, 0) attachedToAnchor:CGPointMake(150, 600)];
//    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.myView attachedToItem:self.yourView];
    UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.myView offsetFromCenter:UIOffsetMake(25, 0) attachedToItem:self.yourView offsetFromCenter:UIOffsetMake(-35, 0)];
    attachment.length = 50;
    attachment.damping = 0.5;
    attachment.frequency = 1;
    [self.animator addBehavior:attachment];
}

//碰撞行为
- (void)collision {
    [self gravity];

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.myView, self.yourView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionMode = UICollisionBehaviorModeEverything;
    [self.animator addBehavior:collision];
}

- (void)pan:(UIPanGestureRecognizer *)panGestureRecognizer {
    UIAttachmentBehavior *attachment;
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
         attachment = [[UIAttachmentBehavior alloc] initWithItem:self.myView attachedToAnchor:point];
        [self.animator addBehavior:attachment];
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        attachment.anchorPoint = point;
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:attachment];
    }
}

//推动行为
- (void)push {
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.myView] mode:UIPushBehaviorModeContinuous];
    push.pushDirection = CGVectorMake(0, 1);
    push.magnitude = 0.8;
    [self.animator addBehavior:push];

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.myView, self.yourView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionMode = UICollisionBehaviorModeEverything;
    [self.animator addBehavior:collision];
}

- (void)snap {
    UISnapBehavior *snap1 = [[UISnapBehavior alloc] initWithItem:self.myView snapToPoint:CGPointMake(100, 600)];
    snap1.damping = 0.3;
    [self.animator addBehavior:snap1];

    UISnapBehavior *snap2 = [[UISnapBehavior alloc] initWithItem:self.yourView snapToPoint:CGPointMake(250, 200)];
    snap2.damping = 0.3;
    [self.animator addBehavior:snap2];
}

- (void)dynamicItem {
    UIDynamicItemBehavior *dynamicItem = [[UIDynamicItemBehavior alloc] initWithItems:@[self.myView]];
    dynamicItem.elasticity = 0.6;
    dynamicItem.friction = 1;
    dynamicItem.density = 10;
    dynamicItem.resistance = 10;
    dynamicItem.allowsRotation = YES;
    [self.animator addBehavior:dynamicItem];

    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.myView]];
    gravity.gravityDirection = CGVectorMake(0, 1);
    gravity.magnitude = 0.5;
    [self.animator addBehavior:gravity];

    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.myView, self.yourView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    collision.collisionMode = UICollisionBehaviorModeEverything;
    [self.animator addBehavior:collision];
}

- (void)buttons {
    NSArray *array = @[@{@"title": @"gravity"},
                       @{@"title": @"collision"},
                       @{@"title": @"attachment"},
                       @{@"title": @"push"},
                       @{@"title": @"snap"},
                       @{@"title": @"dynamicItem"}];

    for (int i = 0; i < 6; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.backgroundColor = [UIColor blackColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];

        NSDictionary *dic = array[i];
        button.frame = CGRectMake(10, i * 50 + 100, 100, 40);
        [button setTitle:dic[@"title"] forState:UIControlStateNormal];
    }
}

- (void)clickAction:(UIButton *)button {
    switch (button.tag) {
        case 0:{
            [self gravity];
            break;
        }
        case 1:{
            [self collision];
            break;
        }
        case 2:{
            [self attachment];
            break;
        }
        case 3:{
            [self push];
            break;
        }
        case 4:{
            [self snap];
            break;
        }
        case 5:{
            [self dynamicItem];
            break;
        }
        default:
            break;
    }
}

- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(200, 120, 100, 100)];
        _myView.backgroundColor = [UIColor greenColor];
        _myView.transform =CGAffineTransformMakeRotation(M_PI_4);//旋转45度
        _myView.userInteractionEnabled = YES;
    }
    return _myView;
}

- (UIView *)yourView {
    if (!_yourView) {
        _yourView = [[UIView alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
        _yourView.backgroundColor = [UIColor orangeColor];
    }
    return _yourView;
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
