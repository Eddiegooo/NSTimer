//
//  TimerProxy.h
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

//注意这里要使用weak
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
