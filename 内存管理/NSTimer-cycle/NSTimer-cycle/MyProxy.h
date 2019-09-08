//
//  MyProxy.h
//  NSTimer-cycle
//
//  Created by WingChing Yip on 2019/9/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyProxy : NSObject

+ (instancetype)proxyWithTarget:(id)target;

@property(nonatomic, weak)id target;

@end

NS_ASSUME_NONNULL_END
