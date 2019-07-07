//
//  ViewController.m
//  01-线程间通信
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"%@", [NSThread currentThread]);
        // 耗时操作: 放在全局队列，异步执行
        // 1. url, 确定一个网络上的资源路径
        NSURL *url = [NSURL URLWithString:@"http://fe.topit.me/e/d1/12/1170068721aa112d1el.jpg"];
        
        // 2. 通过url可以下载对应的网络资源, 网络资源传输的都是二进制
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 3. 二进制转成图片
        UIImage *image = [UIImage imageWithData:data];
        
        // 4. 更新UI，在主线程-》 直接把任务添加到主队列，就会在主队列执行
        dispatch_async(dispatch_get_main_queue(), ^{
            self.iconView.image = image;
            NSLog(@"-----%@", [NSThread currentThread]);

        });
    });
    
}

@end
