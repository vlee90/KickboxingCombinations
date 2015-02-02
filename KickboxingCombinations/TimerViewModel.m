//
//  TimerViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TimerViewModel.h"

@implementation TimerViewModel

-(instancetype)initWithWorkoutProperties:(Workout *)workout {
    if (self = [super init]) {
        self.workout = workout;
        self.helper = [[Helper alloc] init];
        self.currentWorkoutType = workout.type;
        self.currentNumberOfRoundsINT = workout.rounds;
        self.currentRoundTimeINT = workout.roundTime;
        self.currentRestTimeINT = workout.restTime;
        self.currentWarningTimeINT = workout.countdownTimer;
        self.currentNumberOfRoundsSTRING = [self.helper convertTimeIntegerIntoString:self.currentNumberOfRoundsINT];
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
        self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
    return self;
}

@end
