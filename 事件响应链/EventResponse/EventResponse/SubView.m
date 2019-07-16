//
//  SubView.m
//  EventResponse
//
//  Created by WingChing Yip on 2019/7/16.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "SubView.h"

@implementation SubView

// 在子视图中的优先级最高
// 当响应事件后，事件到此结束
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"SubView 事件响应, 当点击SubView的时候，VCRoot touch不响应！");
    
    NSLog(@"SubView 事件响应！next == %@", self.nextResponder);
    
    // 手动向下传递
    [super touchesBegan:touches withEvent:event];
}

@end
