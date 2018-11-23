//
//  SecViewController.m
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import "SecViewController.h"
#import <objc/runtime.h>
#import "TimerProxy.h"
#import "NSTimer+QLTimer.h"
@interface SecViewController ()
{
    NSUInteger count;
}
@property(nonatomic, strong) NSTimer *myTimer;
//定义个属性
@property (nonatomic, strong) id target;

@property (nonatomic, strong) TimerProxy *timerProxy;

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass([self class]);
    
  /** 方法二 */
//    _target = [NSObject new];
//    class_addMethod([_target class], @selector(testTimer), (IMP)timerIMP, "v@:");
//    //这里换成_target  不用self了。  这就没有了循环引用了
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_target selector:@selector(testTimer) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSDefaultRunLoopMode];
    
    
    /** 方法三 */
//    _timerProxy = [TimerProxy alloc];//注意这里只有alloc方法
//    _timerProxy.target = self;
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:_timerProxy selector:@selector(testTimer) userInfo:nil repeats:YES];
    
    /** 方法四 */
    __block typeof(self) weakSelf = self;
    self.myTimer = [NSTimer QLscheduledTimerWithTimeInterval:1.0 repeats:YES block:^{
        __block typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf testTimer];
    }];
    
}


//void timerIMP(id self, SEL _cmd) {
//    NSLog(@"Do some things");
//}



//停止Timer
- (void)dealloc {
    [self.myTimer invalidate];
    self.myTimer = nil;
    
    NSLog(@"Timer dealloc");
}

/** 方法一 */
- (void)didMoveToParentViewController:(UIViewController *)parent {
    if (parent == nil) {
        [self.myTimer invalidate];
        self.myTimer = nil;
    }
}

- (void)testTimer {
    NSLog(@"Do Some Things = %ld", count++);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
