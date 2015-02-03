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
        self.roundTimerOn = false;
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

-(void)beginRoundCountdownTimer {
    if (self.roundTimerOn) {
        self.roundTimerOn = false;
        [self.timer invalidate];
        self.timer = nil;
    }
    else {
        self.roundTimerOn = true;
        self.currentRoundTimeINT -= 1;
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(decreaseCountdownTimer) userInfo:nil repeats:true];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

-(void)decreaseCountdownTimer {
    if (self.roundTimerOn) {
        if (self.currentRoundTimeINT > 1) {
            self.currentRoundTimeINT -= 1;
            self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        }
        else {
            self.roundTimerOn = false;
            self.currentRoundTimeINT -= 1;
            self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        }
    }
    else {
        if (self.currentRestTimeINT > 1) {
            self.currentRestTimeINT -= 1;
            self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
        }
        else {
            self.roundTimerOn = true;
            self.currentRestTimeINT -= 1;
            self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
        }
    }
}





@end
