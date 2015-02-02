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
    NSString* workoutType = @"Advanced";
    NSInteger roundTime = 200;
    NSInteger restTime = 50;
    NSInteger rounds = 2;
    NSInteger warningTime = 15;
    Workout* workout = [[Workout alloc] initWithType:workoutType withRoundTimerOf:roundTime withRestTimeOf:restTime withNumberOfRounds:rounds withCountdownTimer:warningTime];
    self.timerViewModel = [[TimerViewModel alloc] initWithWorkoutProperties:workout];
}

- (void)tearDown {
    [super tearDown];
    self.timerViewModel = nil;
}

-(void)testTimerViewModelHasWorkout {
    XCTAssertNotNil(self.timerViewModel.workout);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
