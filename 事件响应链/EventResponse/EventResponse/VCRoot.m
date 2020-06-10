//
//  VCRoot.m
//  EventResponse
//
//  Created by WingChing Yip on 2019/7/16.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainView = [[MainView alloc] init];
    _mainView.frame = CGRectMake(50, 50, 200, 300);
    _mainView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_mainView];
    
    _subView = [[SubView alloc] init];
    _subView.frame =CGRectMake(30, 30, 100, 200);
    _subView.backgroundColor = [UIColor purpleColor];
    [_mainView addSubview:_subView];
    
    self.view.backgroundColor = [UIColor blueColor];
}

// 当点击屏幕时， 调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"VCRoot 事件响应!");
    NSLog(@"VCRoot 事件响应 next == %@", self.nextResponder);
    
    // 手动向下传递
//    [super touchesBegan:touches withEvent:event];
}

@end
