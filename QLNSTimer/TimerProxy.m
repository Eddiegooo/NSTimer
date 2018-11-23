//
//  TimerProxy.m
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import "TimerProxy.h"

@implementation TimerProxy
/** 方法签名 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}
/** 消息转发 */
- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}


@end
