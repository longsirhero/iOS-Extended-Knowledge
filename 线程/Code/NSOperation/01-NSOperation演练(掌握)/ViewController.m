//
//  ViewController.m
//  01-NSOperation演练(掌握)
//
//  Created by apple on 15-1-16.
//  Copyright (c) 2015年 apple. All rights reserved.、

/**
 GCD --> iOS 4.0
 - 将任务（block）添加到队列（串行/并发(全局)），指定 执行任务的方法(同步(阻塞)/异步)
 - 拿到 dispatch_get_main_queue()。 线程间通信
 - NSOperation无法做到，一次性执行，延迟执行，调度组(op相对复杂)

 
 NSOperation ----> iOS 2.0 （后来苹果改造了NSOperation的底层）
 - 将操作(异步执行)添加到队列(并发/全局)
 - [NSOperationQueue mainQueue] 主队列。 任务添加到主队列， 就会在主线程执行
 - 提供了一些GCD不好实现的，”最大并发数“
 - 暂停/继续 --- 挂起
 - 取消所有的任务
 - 依赖关系
 */

/**
 小结一下:
 只要是NSOperation的子类 就能添加到操作队列
 - 一旦操作添加到队列， 就会自动异步执行
 - 如果没有添加到队列, 而是使用start方法，会在当前线程执行操作
 - 如果要做线程间通信，可以使用[NSOperationQueue mainQueue]拿到主队列，往主队列添加操作(更新UI)
 */

#import "ViewController.h"

@interface ViewController ()

/**负责调度所有的操作*/
@property(nonatomic,strong) NSOperationQueue *opQueue;

@end

@implementation ViewController

// 懒加载的方式，初始化NSOperationQueue对象
- (NSOperationQueue *)opQueue
{
    if (_opQueue == nil) {
        _opQueue = [[NSOperationQueue alloc] init];
    }
    return _opQueue;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    [self dependecy];
    [self opDemo7];
}


/**
 需求： A操作完成后，再执行B操作，C操作完成后，再执行D操作，当所有操作完成后，再执行E操作，刷新UI
 */
- (void)opDemo7 {
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"执行A操作");
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"执行B操作");
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"执行C操作");
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"执行D操作");
    }];
    
    // 添加依赖关系
    [op2 addDependency:op1];
    [op4 addDependency:op3];
    
    // 把操作添加到队列中，等待完成所有操作后，再执行E操作，刷新界面
    [self.opQueue addOperations:@[op1, op2, op3, op4] waitUntilFinished:YES];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLog(@"执行E操作，刷新UI");
    }];
    
}

#pragma mark - 高级操作
// MARK: 依赖关系
- (void)dependecy
{
    /**
     例子：
     1. 下载一个小说的压缩包
     2. 解压缩，删除压缩包
     3. 更新UI
     
     */
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1. 下载一个小说的压缩包, %@",[NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2. 解压缩，删除压缩包, %@",[NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3. 更新UI, %@",[NSThread currentThread]);
    }];
    
    // 指定任务之间的依赖关系 -- 依赖关系可以跨队列(可以在子线程下载完，到主线程更新UI)
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    
    // 注意点：一定不要出现循环依赖关系
//    [op1 addDependency:op3];
    
    // waitUntilFinished 类似GCD的调度组的通知
    // NO 不等待，会直接执行  NSLog(@"come here");
    // YES 等待上面的操作执行结束，再 执行  NSLog(@"come here")
    [self.opQueue addOperations:@[op1, op2] waitUntilFinished:YES];
    
    // 在主线程更新UI
    [[NSOperationQueue mainQueue] addOperation:op3];
    NSLog(@"come here");
}

// MARK: 取消队列里的所有操作
// “取消操作，并不会影响队列的挂起状态”
- (IBAction)cancelAll
{
    // 取消队列的所有操作
    [self.opQueue cancelAllOperations]; // 取消队列的所有操作，会把任务从队列里面全部删除
    
    NSLog(@"取消所有的操作");
    
    // 取消队列的挂起状态
    // （只要是取消了队列的操作，我们就把队列处于启动状态。以便于队列的继续）
    self.opQueue.suspended = NO;
}

// MARK: 暂停/继续 (对队列的暂停和继续)
- (IBAction)pause
{
    // 判断操作的数量，当前队列里面是不是有操作
    if (self.opQueue.operationCount == 0) {
        NSLog(@"没有操作");
        return;
    }
    
    // 暂停继续
    self.opQueue.suspended = !self.opQueue.suspended;
    
    if (self.opQueue.suspended) { // 队列的挂起以后，队列里面的操作还在
        NSLog(@"暂停");
    }else{
        NSLog(@"继续");
    }
}

// MARK: 最大并发数
- (void)opDemo6
{
    // 设置最大的并发数是2 (最大并发数，不是线程的数量。 而是同时执行的操作的数量)
    self.opQueue.maxConcurrentOperationCount = 2;
    
    for (int i = 0; i < 20; i++) {
        NSOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            
            [NSThread sleepForTimeInterval:1.0];
            
            NSLog(@"%@---%d", [NSThread currentThread], i);
        }];
        
        [self.opQueue addOperation:op];
    }
}


#pragma mark - 基本使用
// MARK: 线程间通信(最重要的代码)
- (void)opDemo5
{
    NSOperationQueue *q = [[NSOperationQueue alloc]init];
    
    [q addOperationWithBlock:^{
        NSLog(@"耗时操作....%@", [NSThread currentThread]);
        
        // 在主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"更新UI....%@", [NSThread currentThread]);
        }];
    }];
}

// MARK: NSBlockOperation更简单的使用
- (void)opDemo4
{
    // 队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    for (int i = 0; i < 10; i++) {
        // 不创建操作对象，使用addOperationWithBlock:直接添加操作到队列
        [q addOperationWithBlock:^{
            NSLog(@"%@---%d", [NSThread currentThread], i);
        }];
    }
    
    // 创建并添加一个 NSBlockOperation
    NSBlockOperation * op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"op1 --- %@", [NSThread currentThread]);

    }];
    
    [op1 addExecutionBlock:^{
        NSLog(@"op1-1");
    }];
    
    [q addOperation:op1];
    
    // 创建并添加一个 NSInvocationOperation
    NSOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:@"Invocation"];
    [q addOperation:op2];
}

// MARK: NSBlockOperation使用
- (void)opDemo3
{
    // 相当于GCD的并发队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 主队列(跟GCD里的主队列一样)
//    NSOperationQueue *q = [NSOperationQueue mainQueue];
    
    // 多个操作
    for (int i = 0; i < 10; i++) {
        NSBlockOperation * op = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%@---%d", [NSThread currentThread], i);
        }];
        
        // 把block操作放到队列
        [q addOperation:op];
    }
    
    NSLog(@"完成");
}

// MARK: 多个NSInvocationOperation使用
- (void)opDemo2
{
    // 队列 (GCD里面的并发（全局）队列使用最多。所以NSOperation技术直接把GCD里面的并发队列封装起来)
    // NSOperationQueue队列，本质就是GCD里面的并发队列
    // 操作就是GCD里面异步执行的任务
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 把多个操作放到队列
    for (int i = 0 ; i < 10; i++)
    {
        NSOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:@"Invocation"];
        
        // 把block操作放到队列
        [q addOperation:op];
    }
}

// MARK: 单个NSInvocationOperation使用
- (void)opDemo1
{
    // 1. 创建操作
    NSOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImage:) object:@"Invocation"];
    
    // 2. 启动-- 直接在当前线程执行任务
//    [op start];
    
//    [self downloadImage:@""];
    
    // 2. 放到队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    // 只要把操作添加到队列， ---会自动异步执行调度方法
    [q addOperation:op];
}

#pragma mark - 耗时操作
- (void)downloadImage:(id)obj
{
    NSLog(@"%@---%@", [NSThread currentThread], obj);
}

@end
