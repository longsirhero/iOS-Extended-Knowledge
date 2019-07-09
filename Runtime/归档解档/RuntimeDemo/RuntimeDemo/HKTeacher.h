//
//  HKTeacher.h
//  RuntimeDemo
//
//  Created by WingChing Yip on 2019/7/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface HKTeacher : NSObject<NSSecureCoding>

@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)int age;

@end

NS_ASSUME_NONNULL_END
