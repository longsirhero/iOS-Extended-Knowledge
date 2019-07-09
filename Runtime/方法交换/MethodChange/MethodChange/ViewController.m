//
//  ViewController.m
//  MethodChange
//
//  Created by WingChing Yip on 2019/7/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 现在需要给URL做检测!!
    NSURL *url = [NSURL URLWithString:@"www.baidu.com/中文"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSLog(@"发送了: %@", request);
}


@end
