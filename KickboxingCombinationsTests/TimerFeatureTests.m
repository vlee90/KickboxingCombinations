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

-(void)testRoundTimerBeginsCountdown {
    [self.timerViewModel startButtonPressed];
    XCTAssertTrue(self.timerViewModel.roundModeIsOn);
}

-(void)testRoundTimerDecreasesRoundTime {
    self.timerViewModel.roundModeIsOn = true;
    [self.timerViewModel updateTimer];
    XCTAssertTrue([self.timerViewModel.currentRoundTimeSTRING isEqualToString:@"3:19"]);
    XCTAssertEqual(self.timerViewModel.currentRoundTimeINT, 199);
}

-(void)testRoundTimerChangesToRestModeAt0 {
    self.timerViewModel.currentRoundTimeINT = 0;
    [self.timerViewModel updateTimer];
    XCTAssertFalse(self.timerViewModel.roundModeIsOn);
}

-(void)testStartButtonPressedCanStopTimer {
    self.timerViewModel.isPaused = true;
    [self.timerViewModel startButtonPressed];
    XCTAssertFalse(self.timerViewModel.isPaused);
}

-(void)testIncreaseRoundMethodIncreasesTheRound {
    [self.timerViewModel increaseRound];
    XCTAssertEqualObjects(self.timerViewModel.currentRoundSTRING, @"2");
    XCTAssertEqualObjects(self.timerViewModel.currentNumberOfRoundsSTRING, @"2 / 2");
}

-(void)testIncreaseRoundDoesNotIncreaseStringIfFinalRound {
    self.timerViewModel.currentRoundSTRING = @"2";
    self.timerViewModel.currentNumberOfRoundsSTRING = @"2 / 2";
    XCTAssertEqual([self.timerViewModel.currentRoundSTRING integerValue], self.timerViewModel.workout.rounds);
    [self.timerViewModel increaseRound];
    XCTAssertTrue([self.timerViewModel.currentNumberOfRoundsSTRING isEqualToString:@"2 / 2"]);
}

-(void)testWorkoutCompleteReturnsTrue {
    self.timerViewModel.currentRoundSTRING = @"3";
    BOOL returnValue = [self.timerViewModel workoutComplete];
    XCTAssertTrue(returnValue);
}

-(void)testWorkoutCompleteReturnsFalse {
    BOOL returnValue = [self.timerViewModel workoutComplete];
    XCTAssertFalse(returnValue);
}

@end
