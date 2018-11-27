//
//  ViewController.m
//  SCAnimation
//
//  Created by admin on 2018/11/22.
//  Copyright © 2018 admin. All rights reserved.
//

#import "ViewController.h"
#import "SCViewAnimationViewController.h"
#import "SCCoreAnimationViewController.h"
#import "SCEmitterAnimationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//UIView动画
- (IBAction)viewAnimationAction:(id)sender {
    SCViewAnimationViewController *viewAnimationVC = [[SCViewAnimationViewController alloc] init];
    viewAnimationVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewAnimationVC animated:YES];
}

//核心动画
- (IBAction)coreAnimationAction:(id)sender {
    SCCoreAnimationViewController *coreAnimationVC = [[SCCoreAnimationViewController alloc] init];
    coreAnimationVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:coreAnimationVC animated:YES];
}

//粒子动画
- (IBAction)emitterAnimationAction:(id)sender {
    SCEmitterAnimationViewController *emitterAnimationVC = [[SCEmitterAnimationViewController alloc] init];
    emitterAnimationVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:emitterAnimationVC animated:YES];
}


@end
