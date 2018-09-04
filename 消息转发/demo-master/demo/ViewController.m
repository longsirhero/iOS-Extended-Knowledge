//
//  ViewController.m
//  demo
//
//  Created by 梁明哲 on 2018/6/10.
//  Copyright © 2018年 梁明哲. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化Animal类的对象dog，并调用其在声明 eat函数 
    Animal* dog = [Animal new];

    [dog eat];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
