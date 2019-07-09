//
//  HKTeacher.m
//  RuntimeDemo
//
//  Created by WingChing Yip on 2019/7/8.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import "HKTeacher.h"

@interface HKTeacher ()

@property(nonatomic, assign) int height;

@end

@implementation HKTeacher

- (void)encodeWithCoder:(NSCoder *)coder
{
//    [coder encodeObject: self.name forKey: @"name"];
//    [coder encodeInteger: self.age forKey: @"age"];
    
    /// 可以写成分类
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([HKTeacher class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //归档
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars);
}

+ (BOOL)supportsSecureCoding {
    return YES;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        /// 可以写成分类
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([HKTeacher class], &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //解档
            id value = [coder decodeObjectForKey:key];
            //设置到成员变量身上
            [self setValue:value forKey:key];
        }
    }
    return self;
}

@end
