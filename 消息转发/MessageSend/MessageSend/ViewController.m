//
//  ViewController.m
//  MessageSend
//
//  Created by WingChing Yip on 2019/7/9.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[Person new] sendMessage:@"hello"];
    
}


@end
