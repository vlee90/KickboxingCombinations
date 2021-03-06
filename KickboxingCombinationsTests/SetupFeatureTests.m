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
#import "TimerViewController.h"
#import <OCMock/OCMock.h>

@interface SetupViewModel (Testing)

@property NSInteger currentNumberOfRoundsINT;
@property NSInteger currentRoundTimeINT;
@property NSInteger currentRestTimeINT;
@property NSInteger currentWarningTimeINT;
@property(nonatomic, strong) Workout* workout;

@end

@interface SetupFeatureTests : XCTestCase

@property (nonatomic, strong) SetupViewModel* setupViewModel;

@end

@implementation SetupFeatureTests

- (void)setUp {
    [super setUp];
    self.setupViewModel = [[SetupViewModel alloc] initWithStateProperties];
}

- (void)tearDown {
    [super tearDown];
    self.setupViewModel = nil;
}

- (void)testIfCreateWorkoutCreatesWorkoutObject {
    [self.setupViewModel createWorkout];
    XCTAssertTrue([self.setupViewModel.workout isKindOfClass:[Workout class]]);
    XCTAssertNotNil(self.setupViewModel.workout);
}

-(void)testIfCreateWorkoutAssignsSetupViewModelPropertiesCorrectly {
    self.setupViewModel.currentWorkoutType = @"Advanced";
    self.setupViewModel.currentRoundTimeINT = 180;
    self.setupViewModel.currentRestTimeINT = 30;
    self.setupViewModel.currentWarningTimeINT = 30;
    self.setupViewModel.currentNumberOfRoundsINT = 10;
    
    [self.setupViewModel createWorkout];

    XCTAssertTrue(self.setupViewModel.workout.type == self.setupViewModel.currentWorkoutType);
    XCTAssertTrue(self.setupViewModel.workout.roundTime == self.setupViewModel.currentRoundTimeINT);
    XCTAssertTrue(self.setupViewModel.workout.restTime == self.setupViewModel.currentRestTimeINT);
    XCTAssertTrue(self.setupViewModel.workout.rounds == self.setupViewModel.currentNumberOfRoundsINT);
    XCTAssertTrue(self.setupViewModel.workout.countdownTimer == self.setupViewModel.currentWarningTimeINT);
}

-(void)testIfCreateTimerViewControllerHasATimerViewModel {
    TimerViewController* timerViewController = [self.setupViewModel createTimerViewControllerFromStoryboardWithTimerViewModel];
    XCTAssertNotNil(timerViewController.timerViewModel);
}

-(void)testIfCreateComboViewControllerHasAComboListViewModel {
    ComboListViewController * comboListViewController = [self.setupViewModel createComboListViewControllerFromStoryboardWithComboViewModel];
    XCTAssertNotNil(comboListViewController.comboListViewModel);
}

-(void)testIfComboViewControllerIsCreated {
    ComboListViewController * comboListViewController = [self.setupViewModel createComboListViewControllerFromStoryboardWithComboViewModel];
    XCTAssertNotNil(comboListViewController);
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
    XCTAssertTrue(self.setupViewModel.currentNumberOfRoundsINT == 4);
}

-(void)testNegativeIncrementOfNumberOfRounds {
    //Starts with 3 rounds
    [self.setupViewModel numberOfRoundsNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentNumberOfRoundsINT == 2);
}

-(void)testNegativeIncrementOfNumberOfRoundsCannotGoBelow1 {
    self.setupViewModel.currentNumberOfRoundsINT = 1;
    [self.setupViewModel numberOfRoundsNegativeIncrement];
    XCTAssertTrue(self.setupViewModel.currentNumberOfRoundsINT = 1);
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

@end
