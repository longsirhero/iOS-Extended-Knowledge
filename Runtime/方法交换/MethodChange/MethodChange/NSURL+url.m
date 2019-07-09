//
//  NSURL+url.m
//  MethodChange
//
//  Created by WingChing Yip on 2019/7/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>

// class_getInstanceMethod: 获取对象方法
// class_getClassMethod: 获取类方法

@implementation NSURL (url)

+ (void)load {
   Method URLWithStr = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method HKURLWithStr = class_getClassMethod([NSURL class], @selector(HK_URLWithString:));
    // 交换
    method_exchangeImplementations(URLWithStr, HKURLWithStr);
    
}

+ (instancetype)HK_URLWithString:(NSString *)URLString {
//    NSURL *url = [NSURL URLWithString:URLString]; 死循环
    NSURL *url = [NSURL HK_URLWithString:URLString]; // 其实这里调用了系统的方法：URLWithString:
    if (url == nil) {
        NSLog(@"哥们这个URL为空！");
    }
    return url;
}

@end
