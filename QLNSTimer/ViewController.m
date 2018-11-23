//
//  ViewController.m
//  QLNSTimer
//
//  Created by FQL on 2018/11/23.
//  Copyright © 2018 FQL. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSTimer *myTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = NSStringFromClass([self class]);
    self.view.backgroundColor = [UIColor cyanColor];
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
//    
//    //或者
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
}

- (void)testTimer {
    NSLog(@"Do Some Things");
}

//停止Timer
- (void)dealloc {
    [self.myTimer invalidate];
    self.myTimer = nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    SecViewController *secVC = [[SecViewController alloc] init];
    [self.navigationController pushViewController:secVC animated:YES];
    
}





@end
