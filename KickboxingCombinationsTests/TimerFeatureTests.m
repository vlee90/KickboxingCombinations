//
//  TimerFeatureTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TimerViewModel.h"
#import "Workout.h"
#import "SetupViewModel.h"
#import <OCMock/OCMock.h>

@interface TimerFeatureTests : XCTestCase

@property (nonatomic, strong) TimerViewModel* timerViewModel;

@end

@implementation TimerFeatureTests

- (void)setUp {
    [super setUp];
    SetupViewModel* setupViewModel = [[SetupViewModel alloc] initWithPoolProperties];
    
//    self.timerViewModel = [[TimerViewModel alloc] initWithWorkout:<#(Workout *)#>]
}

- (void)tearDown {
    [super tearDown];
    self.timerViewModel = nil;
}

-(void)testTimerViewModelHasWorkout {
    id lol = [OCMockObject mockForClass:[SetupViewModel class]];
    [[[lol stub] andReturn:@"hi"] createWorkout];
    [lol createWorkout];
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
