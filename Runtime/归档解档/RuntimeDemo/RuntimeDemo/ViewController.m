//
//  ViewController.m
//  RuntimeDemo
//
//  Created by WingChing Yip on 2019/7/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "ViewController.h"
#import "HKTeacher.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Ivar: runtime里面 Ivar 代表成员变量
    unsigned int count = 0;
//    class_copyIvarList([UIButton class], &count);
    Ivar *ivars = class_copyIvarList([HKTeacher class], &count);
    Ivar ivar = ivars[0];
    const char * name = ivar_getName(ivar);
    NSLog(@"%d, %@", count, [NSString stringWithUTF8String:name]);
    
}

- (IBAction)save:(UIButton *)sender {
    // 创建对象
    HKTeacher * t = [[HKTeacher alloc] init];
    t.name = @"hank";
    t.age = 18;
    // 沙盒
    NSString * temp = NSTemporaryDirectory();
    NSString * filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    // 归档
    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:t requiringSecureCoding:NO error:&error];
    [data writeToFile:filePath atomically:true];
    NSLog(@"error: %@", error);
    
}

- (IBAction)read:(UIButton *)sender {
    // 路劲
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"t.hank"];
    NSError *error;
    // 解档
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    HKTeacher *teacher = [NSKeyedUnarchiver unarchivedObjectOfClass:[HKTeacher class] fromData:data error:&error];
    NSLog(@"error:%@, teacher:%@", error, teacher.name);
}


@end
