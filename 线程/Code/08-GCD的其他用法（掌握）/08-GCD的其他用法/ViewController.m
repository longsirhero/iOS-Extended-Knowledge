//
//  ViewController.m
//  08-GCD的其他用法
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self once];
    
}

#pragma mark - 一次性执行
- (void)once
{
    static dispatch_once_t onceToken;
    NSLog(@"%ld", onceToken);
    
    dispatch_once(&onceToken, ^{
        NSLog(@"%----ld", onceToken);

        NSLog(@"真的执行一次么？");
    });
    NSLog(@"完成");

}


#pragma mark - 调度组(分组)
- (void)group
{
    /**
     应用场景：
     开发的时候，有的时候出现多个网络请求都完成以后（每一个网络请求的事件长短不一定），再统一通知用户 
     
     
     比如： 下载小说：三国演义， 红楼梦， 金X梅
     */
    // 实例化一个调度组
    dispatch_group_t group = dispatch_group_create();
    
    // 队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 任务添加到队列queue
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载小说A---%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载小说B---%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"下载小说X---%@", [NSThread currentThread]);
    });
    
    // 获得所有调度组里面的异步任务完成的通知
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"下载完成，请观看%@", [NSThread currentThread]); // 异步的
//    });

    //注意点： 在调度组完成通知里，可以跨队列通信
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 更新UI，在主线程
        NSLog(@"下载完成，请观看%@", [NSThread currentThread]); // 异步的
    });
}

#pragma mark - 延时操作
- (void)delay
{
    /**
     参数: 
     now 0
     NSEC_PER_SEC: 很大的数字
    
     */
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    
    // 参数： when : 表示从现在开始，经过多少纳秒以后
    // queue ：  在哪一个队列里面执行后面的任务
//    dispatch_after(when, dispatch_get_main_queue(), ^{
//        NSLog(@"点我了-- %@", [NSThread currentThread]);
//    });
//    
    dispatch_after(when, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"点我了-- %@", [NSThread currentThread]);
    });
}

@end
