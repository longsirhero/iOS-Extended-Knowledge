//
//  Animal.m
//  demo
//
//  Created by 梁明哲 on 2018/6/10.
//  Copyright © 2018年 梁明哲. All rights reserved.
//

#import "Animal.h"

#import <objc/message.h>
#import "AnimalForwardingTarget.h"
#import "AnimalForwardInvocation.h"
@implementation Animal

/*再头文件中声明了eat 函数，但是没有实现这个方法，所以有一条警告⚠️:Method definition for 'eat' not found */


/**在发生崩溃之前,会做三步处理**/
/**/

/*动态方法解析*/
/*在本类 Class Animal中寻找可以处理“eat”的方法*/

/*
 * function: resolveInstanceMethod
 * NSObject.h中声明的类方法 提供给用户向该类的动态添加selector(函数方法)的机会
 *
 */
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@"sel = %@",NSStringFromSelector(sel));
//    if (sel == @selector(eat)) {
//            class_addMethod(self, sel, (IMP)eatMeat, "v@:@:");
//            return YES;
//        }
//    return [super resolveInstanceMethod:sel];
//}
/*
 *function: eatMeat
 *通过resolveInstanceMethod 的IMP指向函数，
 */
void eatMeat(id self,SEL sel) {
    NSLog(@"---方法一:动态方法解析 eat meat---");
}

/*如果动态方法解析无法处理(比如把上面的 resolveInstanceMethod 函数注释掉)则系统会把进入备援接收者处理该消息*/
/*
 *function: forwardingTargetForSelector
 *如果resolveInstanceMethod 中并没有处理 eat事件的动态方法，系统将会在进入本函数尝试在其他类中寻找实现选择子为"eat"的方法
 *本例Class Action将作为“备援接收者”处理 eat事件
 */
- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSString *selectorStr = NSStringFromSelector(aSelector);//获取消息的选择子
    if ([selectorStr isEqualToString:@"eat"]) {
        AnimalForwardingTarget *action = [AnimalForwardingTarget new];
        return action;
    }
    return [super forwardingTargetForSelector:aSelector];
    //    return [[Mbxb alloc]init];
}

/*如果没有备援接收者处理该消息时，便会进入消息重定向*/
/*调用此方法如果不能处理就会调用父类的方法，一直到NSObject，如果NSObject也无法处理，则会调用doesNotRecognizeSelector抛出异常*/

/*
 消息重定向 第一步:声明方法签名
 */
- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector{
    NSString *selectedStr = NSStringFromSelector(aSelector); //获取消息的选择子
    if ([selectedStr isEqualToString:@"eat"]) {
        NSMethodSignature *sign = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        return sign;
    }
    return [super methodSignatureForSelector:aSelector];
}

//修改选择子为“eatDogFood” ，此为AnimalForwardInvocation 中的方法 实现
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    AnimalForwardInvocation* animalInvocation = [AnimalForwardInvocation new];
    anInvocation.selector = NSSelectorFromString(@"eatDogFood");
    if ([animalInvocation respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:animalInvocation];
    } else {
        [super forwardInvocation:anInvocation];
    }
}
@end



