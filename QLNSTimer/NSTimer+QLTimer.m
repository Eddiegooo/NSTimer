//
//  NSTimer+QLTimer.m
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import "NSTimer+QLTimer.h"

@implementation NSTimer (QLTimer)

+(NSTimer *)QLscheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(nonnull void (^)(void))timerBlock {
    return [self scheduledTimerWithTimeInterval:timeInterval
                                         target:self
                                       selector:@selector(QLTimerHandle:)
                                       userInfo:[timerBlock copy] //注意copy
                                        repeats:repeats];
}

+(void)QLTimerHandle:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
