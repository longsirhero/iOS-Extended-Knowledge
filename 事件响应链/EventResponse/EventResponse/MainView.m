//
//  MainView.m
//  EventResponse
//
//  Created by WingChing Yip on 2019/7/16.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"MainView 事件响应, 当点击SubView的时候，touchesBegan不响应(不重写)，往上传递到mainview");
    
    NSLog(@"MainView 事件响应 next == %@", self.nextResponder);
    
    // 手动向下传递
    [super touchesBegan:touches withEvent:event];
}

@end
