//
//  ViewController.m
//  备课代码-01-GCD的基本使用
//
//  Created by 刘天源 on 15/1/10.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self gcdDemo1];
}

#pragma mark - 全局队列
/**
 全局队列，异步执行
 */
- (void)gcdDemo8 {
   
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}

#pragma mark - 同步任务的应用场景
-(void)gcdDemo7 {
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
    
    // 添加任务，要求必须先执行完登录才能够下载
    dispatch_sync(queue, ^{
        NSLog(@"用户登录 %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载小说A %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载小数B %@", [NSThread currentThread]);
    });
}

#pragma mark - 主队列
/**
 同步：不开线程，需要等待前一个任务执行完成，才会调度后面的任务！
 */
- (void)gcdDemo6 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 同步执行
    dispatch_sync(queue, ^{
        NSLog(@"执行----");
        NSLog(@"%@", [NSThread currentThread]);
    });
}

/**
 主队列，异步执行
 */
- (void)gcdDemo5 {
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 异步执行
    for (int i = 0; i < 10; i++) {
        NSLog(@"调度前-----");
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"完成-----");
}

#pragma mark - GCD演练
/**
 并发队列，同步执行
 */
- (void)gcdDemo4 {
    // 1. 队列
    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 同步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}

/**
 并发队列，异步执行
 */
- (void)gcdDemo3 {
    // 1. 队列
    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 异步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    
}

/**
 串行队列，异步执行
 */
- (void)gcdDemo2 {
    // 1. 队列
    dispatch_queue_t queue = dispatch_queue_create("itcast", NULL);
    
    // 2. 异步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}

/**
 串行队列，同步执行(开发中非常少用)
 */
- (void)gcdDemo1 {

    // 1. 队列
//    dispatch_queue_t queue = dispatch_queue_create("icast", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue = dispatch_queue_create("icast", NULL);
    NSLog(@"执行前----");
    
    // 执行任务
    for (int i = 0; i < 10; i++) {
        NSLog(@"调度----");
        
        // 在队列中"同步"执行任务，串行对列添加同步执行任务，会立即被执行
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"for 后面");
}

@end
