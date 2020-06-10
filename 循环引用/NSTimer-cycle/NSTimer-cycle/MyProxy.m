//
//  MyProxy.m
//  NSTimer-cycle
//
//  Created by WingChing Yip on 2019/9/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "MyProxy.h"

@implementation MyProxy

+ (instancetype)proxyWithTarget:(id)target {
    MyProxy *proxy = [[MyProxy alloc] init];
    proxy.target = target;
    return proxy;
}

// 采用消息转发机制解决循环引用
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

@end
