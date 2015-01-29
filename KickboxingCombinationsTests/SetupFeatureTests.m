//
//  SetupFeatureTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SetupViewModel.h"
#import "Workout.h"

@interface SetupFeatureTests : XCTestCase

@property (nonatomic, strong) SetupViewModel* setupViewModel;

@end

@implementation SetupFeatureTests

- (void)setUp {
    [super setUp];
    self.setupViewModel = [[SetupViewModel alloc] init];
}

- (void)tearDown {
    [super tearDown];
    self.setupViewModel = nil;
}

- (void)testIfCreateWorkoutCreatesWorkoutObject {
    //Given
    NSString* workoutType = @"Beginner";
    NSString* roundLength = @"5:00";
    NSString* restPeriod = @"1:00";
    NSInteger numberOfRounds = 5;
    NSInteger countdownTimer = 10;
    
    //Do
    [self.setupViewModel createWorkoutOfType:workoutType withRoundLengthOf:roundLength withRestBetweenRounds:restPeriod withNumberOfRounds:numberOfRounds withCountdownRingerStartingAt:countdownTimer];
    //Assert
    XCTAssertTrue([self.setupViewModel.workout isKindOfClass:[Workout class]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
