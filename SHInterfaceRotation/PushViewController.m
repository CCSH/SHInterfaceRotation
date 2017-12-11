//
//  PushViewController.m
//  test
//
//  Created by CSH on 2017/12/11.
//  Copyright © 2017年 CSH. All rights reserved.
//

#import "PushViewController.h"
#import "AppDelegate.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnClick:(id)sender {
    NSLog(@"旋转");
    
    //支持旋转
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isRotation = YES;
    
    [self interfaceOrientation:UIInterfaceOrientationLandscapeLeft];
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    //强制转换
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //关闭旋转
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.isRotation = NO;
    
    [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

@end
