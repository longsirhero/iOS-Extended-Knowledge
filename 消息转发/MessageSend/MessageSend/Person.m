//
//  Person.m
//  MessageSend
//
//  Created by WingChing Yip on 2019/7/9.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "Person.h"

#import <objc/message.h>

#import "SpareWheel.h"

/// 视频解析地址： https://www.youtube.com/watch?v=okFCg2x8XvU

@implementation Person

void sendMessage(id self, SEL _cmd, NSString *msg) {
    NSLog(@"--%@", msg);
}

// 1、动态解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    // 1、匹配方法
//    NSString *methodName = NSStringFromSelector(sel);
//    
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//       return class_addMethod(self, sel, (IMP)sendMessage, "v@:@");
//    }
    return NO;
}

// 2、备用接受者
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *methodName = NSStringFromSelector(aSelector);
//    if ([methodName isEqualToString:@"sendMessage:"]) {
//        // 这里不是添加方法了， 返回备用接受者处理
//        return [SpareWheel new];
//    }
//    // 没有的话， 走自己的继承树
    return [super forwardingTargetForSelector:aSelector];
}

// 3、慢速转发
// 3.1 方法签名
// 3.2 完整的消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *methodName = NSStringFromSelector(aSelector);
    if ([methodName isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL sel = [anInvocation selector];
//    SpareWheel *tempObj = [SpareWheel new];
//    if ([tempObj respondsToSelector:sel]) {
//        // 如果能响应， 把tempObj作为方法的接受者
//        [anInvocation invokeWithTarget:tempObj];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
    [super forwardInvocation:anInvocation];
}

// 前面都找不到方法，会走以下方法
// 为防止奔溃， 可以重写以下方法
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"找不到当前方法");
}

@end
