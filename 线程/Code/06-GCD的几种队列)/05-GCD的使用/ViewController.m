//
//  ViewController.m
//  05-GCD的使用
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.

/**
 队列的选择：
 串行队列异步执行
 -  开一条线程, 顺序执行
 -  效率：不高，执行比较慢，资源占用小 -》 省电
 
 一般网络是3G，对想能要求不会很高。
 
 并发队列异步执行
 - 开启多条线程，并发执行
 - 效率：高，执行快，资源消耗大-》费电
 使用场合：
 - 网络WiFi，或者需要很快的响应，要求用户体验非常流畅。
 -对任务执行顺序没有要求
 
 -同步任务：一般只会在并发队列， 需要阻塞后续任务。必须等待同步任务执行完毕，再去执行其他任务。"依赖"关系
 */

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
    
    [self gcdTest9];
}

#pragma mark - GCD信号量：

/**
 需求： 先执行A任务，再执行B任务，先执行C任务，再执行D任务，B任务执行永远在A之后，D任务永远在后面，当A,B,C,D任务都执行完成后，再执行E操作
 */
- (void)gcdTest9 {
    // 创建一个信号量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    // 创建一个线程组
    dispatch_group_t group = dispatch_group_create();
    // 创建一个线程队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        // 异步串行 A -> B
        dispatch_queue_t queue1 = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue1, ^{
            NSLog(@"执行A操作");
        });
        dispatch_async(queue1, ^{
            NSLog(@"执行B操作");
            sleep(1);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_group_async(group, queue, ^{
        // 异步串行  C -> D
        dispatch_queue_t queue2 = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue2, ^{
            NSLog(@"执行C操作");
        });
        dispatch_async(queue2, ^{
            NSLog(@"执行D操作");
            sleep(1);
            dispatch_semaphore_signal(semaphore);
        });
    });
    
    dispatch_group_notify(group, queue, ^{
        // 俩次信号等待
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        // 开始执行第三个线程
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"执行E操作");
            sleep(2);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"回到主线程刷新UI");
            });
        });
    });
}

/**
 全局队列跟并发队列的区别
 1. 全局队列没有名称 并发队列有名称
 2. 全局队列，是供所有的应用程序共享。
 3. 在MRC开发，并发队列，创建完了，需要释放。 全局队列不需要我们管理
 */
#pragma mark - CGD - 全局队列
- (void)gcdTest8
{
    // 获得全局队列
    /**
     参数：第一个参数，一般 写 0（可以适配 iOS 7 & 8）
     iOS 7
     DISPATCH_QUEUE_PRIORITY_HIGH 2  高优先级
     DISPATCH_QUEUE_PRIORITY_DEFAULT 0  默认优先级
     DISPATCH_QUEUE_PRIORITY_LOW (-2) 低优先级
     DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN 后台优先级
     
     iOS 8
     QOS_CLASS_DEFAULT  0
     
     第二个参数：保留参数 0
     */
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 添加异步任务
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    
}

#pragma mark - GCD- 同步任务的作用
- (void)gcdTest7
{
    // 并发队列
    dispatch_queue_t  queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
    
    /**
     例子：有一个小说网站
     - 必须登录，才能下载小说
     
     有三个任务：
     1. 用户登录
     2. 下载小说A
     3. 下载小说B
     */
    // 添加任务
    // 同步任务，需要马上执行。 不开新线程
    dispatch_sync(queue, ^{
        NSLog(@"用户登录 %@", [NSThread currentThread]);
    });
    //
    dispatch_async(queue, ^{
        NSLog(@"下载小说A %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"下载小说B %@", [NSThread currentThread]);
    });
}


#pragma mark - GCD-主队列
/**
  主队列：专门负责在主线程上调度任务，不会在子线程调度任务，在主队列不允许开新线程.
  同步执行：要马上执行
  结果：死锁
 */
- (void)gcdTest6
{
    // 1. 获得主队列-> 程序启动，--> 至少有一个主线程-> 一开始就会创建主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"1----");
    
    // 2. 同步执行任务
    for (int i = 0; i < 10; i++) {
        NSLog(@"调度前---");
        // 同步：把任务放到主队列里，但需是马上执行
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        NSLog(@"睡会");
        [NSThread sleepForTimeInterval:2.0];
    }
    NSLog(@"完成----");

}

/**
 主队列：专门负责在主线程上调度任务，不会在子线程调度任务，在主队列不允许开新线程.
 异步执行： 会开新线程，在新线程执行
 结果: 不开线程， 只能在主线程上面，顺序执行!
 */
- (void)gcdTest5
{
    // 1. 获得主队列-> 程序启动，--> 至少有一个主线程-> 一开始就会创建主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"1----");
    
    // 2. 异步执行任务
    for (int i = 0; i < 10; i++) {
        NSLog(@"调度前---");
        // 异步：把任务放到主队列里，但是不需要马上执行
        dispatch_async(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
        NSLog(@"睡会");
        [NSThread sleepForTimeInterval:2.0];
    }
    NSLog(@"完成----");
}

#pragma mark - GCDG演练
/**
  并发队列：可以同时执行多个任务
  同步任务：不会开辟新线程，是在当前线程执行
  结果：不开新线程，顺序一个一个执行。
 */
- (void)gcdTest4
{
    NSLog(@"----1");
    //1. 并行队列
    dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 同步执行任务
    for (int i = 0; i < 10; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%@ %d", [NSThread currentThread], i);
        });
    }
    NSLog(@"----2");
}

/**
 并发队列：可以同时执行多个任务
 异步执行：会开新线程，在新线程执行
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
