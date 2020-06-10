//
//  ViewController.m
//  NSTimer-cycle
//
//  Created by WingChing Yip on 2019/9/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "ViewController.h"
#import "MyProxy.h"
#import "MyProxyCls.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 使用block的NSTimer的时候， 采用weakSelf
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerTest];
//    }];
    
    // 2. 采用中间者对象解决循环引用， 中间者继承NSObject, 实现消息转发机制
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[MyProxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // 3. 采用中间者对象解决循环引用， 中间者继承NSProxy, 实现消息转发机制()
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[MyProxyCls proxyWithTarger:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
    [self.timer invalidate];
}

@end
