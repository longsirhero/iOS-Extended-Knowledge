//
//  MyProxyCls.m
//  NSTimer-cycle
//
//  Created by WingChing Yip on 2019/9/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "MyProxyCls.h"

@implementation MyProxyCls

+ (instancetype)proxyWithTarger:(id) target {
    MyProxyCls *proxy = [MyProxyCls alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
