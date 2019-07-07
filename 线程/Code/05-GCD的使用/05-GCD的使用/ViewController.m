//
//  ViewController.m
//  05-GCD的使用
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 核心概念：
// 任务：block
// 队列：把任务放到队列里面，队列先进先出的原则，
// 串行队列：顺序，一个一个执行(必须一个任务执行完了，才能从队列里面取出下一个任务)
// 并发队列：同时，同时执行很多个任务（可以同时取出很多个任务，只要有线程去执行）

// 同步sync：不会开新线程
// 异步async：会开新线程，多线程的代名词

// 串行队列同步执行：不开线程，在原来线程里面一个一个顺序执行
// 串行队列异步执行：开一条线程，在这个新线程里面一个一个顺序执行
// 并发队列异步执行：开多个线程，并发执行（不一定是一个一个）执行
// 并发队列同步执行：不开线程，在原来线程里面一个一个顺序执行

// 阶段性总结：
// 1. 开不开线程，由执行任务方法决定，同步不开线程，异步肯定开线程
// 2. 开多少线程，由队列决定，串行 最多 开一个线程， 并发可以开多个线程。 具体开多少个，有GCD底层决定，程序猿不能控制

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self gcdTest3];
}

#pragma GCDG演练
/**
  并发队列：可以同时执行多个任务
  同步任务：不会开辟新线程，是在当前线程执行
  结果：不开新线程，顺序一个一个执行。
 */
- (void)gcdTest4
{
    //1. 并行队列
    dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 同步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}

/**
 并发队列：可以同时执行多个任务
 异步执行：肯定会开新线程，在新线程执行
 结果：会开很多个线程，同时执行
 */
- (void)gcdTest3
{
    //1. 并行队列
    dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 异步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}

/**
 串行队列：一个一个执行
 异步执行：肯定会开新线程，在新线程执行
 结果：只会开一个线程，而且所有任务都在这个新的线程里面执行
 */
- (void)gcdTest2
{
    // 1. 串行队列
    // 下面两种写法是一样的
//    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue = dispatch_queue_create("itcast", NULL);

    
    // 2. 异步执行
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
}


/**
 串行队列：顺序，一个一个执行
 同步任务：不会开辟新线程，是在当前线程执行
 结果：不开新线程，在当前线程顺序执行
 
 dispatch : 调度，GCD里面函数，都是以dispatch开头的
 */
- (void)gcdTest1
{
    // 1. 创建一个串行队列
    //参数：1. 队列标签 2. 队列的属性
    dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"开始!!");

    // 2. 同步执行任务
    // 一般只要使用”同步“执行，串行队列对添加的同步任务，会立马执行
    dispatch_sync(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"完成!!");
}

@end
