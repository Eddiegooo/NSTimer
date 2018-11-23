//
//  NSTimer+QLTimer.h
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (QLTimer)
/** 定义一个加方法 */
+ (NSTimer *)QLscheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void(^)(void))timerBlock;

@end

NS_ASSUME_NONNULL_END
