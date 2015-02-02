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
        self.timerOn = false;
        self.helper = [[Helper alloc] init];
        self.currentWorkoutType = workout.type;
        self.currentNumberOfRoundsINT = workout.rounds;
        self.currentRoundTimeINT = workout.roundTime;
        self.currentRestTimeINT = workout.restTime;
        self.currentWarningTimeINT = workout.countdownTimer;
        self.currentRoundSTRING = @"1";
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%@ / %ld", self.currentRoundSTRING, (long)self.currentNumberOfRoundsINT];
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
        self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
    return self;
}

-(void)hitTimerCountdown {
    if (self.timerOn) {
        self.timerOn = false;
        NSLog(@"TIMER IS ON");
    }
    else {
        self.timerOn = true;
        NSLog(@"TIMER IS OFF");
    }
}

@end
