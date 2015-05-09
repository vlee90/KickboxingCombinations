//
//  WorkoutManagerTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 5/8/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "WorkoutManager.h"
#import "TechniqueManager.h"
#import "Constants.h"

@interface WorkoutManager (Testing)

@property (strong, nonatomic) NSArray *combinationList;

@end

@interface WorkoutManagerTests : XCTestCase

@property (strong, nonatomic) WorkoutManager *workoutManager;

@end

@implementation WorkoutManagerTests

- (void)setUp {
    [super setUp];
    self.workoutManager = [WorkoutManager singleton];
    NSArray *boxingCombos = [[TechniqueManager singleton] getCombinations];
    [self.workoutManager setWorkoutCombintationList:boxingCombos];
}

- (void)tearDown {
    self.workoutManager = nil;
    [super tearDown];
}

- (void)testSetWorkoutCombinationList {
    NSArray *boxingCombos = [[TechniqueManager singleton] getCombinations];
    [self.workoutManager setWorkoutCombintationList:boxingCombos];
    XCTAssert([[self.workoutManager.combinationList objectAtIndex:0] isEqualToString:kBOXING_TECH_ONE]);
}

@end
