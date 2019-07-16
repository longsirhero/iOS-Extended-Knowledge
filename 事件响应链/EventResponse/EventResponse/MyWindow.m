//
//  MyWindow.m
//  EventResponse
//
//  Created by WingChing Yip on 2019/7/16.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"MyWindow 事件响应 next == %@", self.nextResponder);
    
    // 手动向下传递
    [super touchesBegan:touches withEvent:event];
}

@end
