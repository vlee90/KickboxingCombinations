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
    self.setupViewModel = [[SetupViewModel alloc] initWithPoolProperties];
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

-(void)testPositiveIncrementOfType {
    //Given
    //Starts with Beginner
    //Do
    [self.setupViewModel typePositiveIncrement];
    //Assert
    XCTAssertTrue([self.setupViewModel.currentWorkoutType isEqualToString:@"Advanced"]);
}

-(void)testNegativeIncrementOfType {
    //Starts with Beginner
    [self.setupViewModel typeNegativeIncrement];
    XCTAssertTrue([self.setupViewModel.currentWorkoutType isEqualToString:@"Advanced"]);
}

-(void)testPositiveIncrementOfNumberOfRounds {
    //Starts with 3 rounds
    [self.setupViewModel numberOfRoundsPositiveIncrement];
    XCTAssertTrue(self.setupViewModel.currentNumberOfRounds == 4);
}

-(void)testNegativeIncrementOfNumberOfRounds {
    //Starts with 3 rounds
    [self.setupViewModel numberOfRoundsNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentNumberOfRounds == 2);
}

-(void)testNegativeIncrementOfNumberOfRoundsCannotGoBelow1 {
    self.setupViewModel.currentNumberOfRounds = 1;
    [self.setupViewModel numberOfRoundsNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentNumberOfRounds = 1);
}

-(void)testPositiveIncrementOfRoundTime {
    [self.setupViewModel roundTimePositiveIncrement];
    XCTAssertTrue(self.setupViewModel.currentRoundTimeINT == 310);
}

-(void)testNegativeIncrementOfRoundTime {
    [self.setupViewModel roundTimeNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentRoundTimeINT == 290);
}

-(void)testNegativeIncrementOfRoundTimeCannotGoBelow10 {
    self.setupViewModel.currentRoundTimeINT = 10;
    [self.setupViewModel roundTimeNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentRoundTimeINT = 10);
}

-(void)testPositiveIncrementOfRestTime {
    [self.setupViewModel roundRestPositiveIncrement];
    XCTAssertTrue(self.setupViewModel.currentRestTimeINT == 70);
}

-(void)testNegativeIncrementOfRestTime {
    [self.setupViewModel roundRestNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentRestTimeINT == 50);
}

-(void)testNegativeIncrementOfRestTimeCannotGoBelow10 {
    self.setupViewModel.currentRestTimeINT = 10;
    [self.setupViewModel roundRestNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentRestTimeINT = 10);
}

-(void)testPositiveIncrementOfWarningTime {
    [self.setupViewModel warningTimePositiveIncrement];
    XCTAssertTrue(self.setupViewModel.currentWarningTimeINT == 15);
}

-(void)testNegativeIncrementOfWarningTime {
    [self.setupViewModel warningTimeNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentWarningTimeINT == 5);
}

-(void)testNegativeIncrementOfWarningTimeCannotGoBelow5 {
    self.setupViewModel.currentWarningTimeINT = 5;
    [self.setupViewModel warningTimeNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentWarningTimeINT == 5);
}

-(void)testConvertTimeIntoString {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
