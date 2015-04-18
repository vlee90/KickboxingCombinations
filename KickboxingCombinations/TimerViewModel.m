//
//  TimerViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TimerViewModel.h"

@interface TimerViewModel ()

@property NSDate* startDate;
@property NSDate* stopDate;
@property NSTimeInterval deltaTime;

@end

@implementation TimerViewModel

-(instancetype)initWithWorkoutProperties:(Workout *)workout {
    if (self = [super init]) {
        self.workout = workout;
        self.roundModeIsOn = true;
        self.isPaused = true;
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

-(void)updateTimer {
    //Round Mode
    if (self.roundModeIsOn == true && [self workoutComplete] == false) {
        if (self.currentRoundTimeINT > 0) {
            [self incrementRoundTimer];
        }
        else {
            self.roundModeIsOn = false;
            [self resetRestTimer];
            [self resetRestTimer];
        }
    }
    //Rest Mode
    else if (self.roundModeIsOn == false && [self workoutComplete] == false) {
        if (self.currentRestTimeINT > 0) {
            [self incrementRestTimer];
        }
        else {
            [self increaseRound];
            self.roundModeIsOn = true;
            [self resetRoundTimer];
            [self resetRestTimer];
        }
    }
    //End of workout
    else {
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)startButtonPressed {
    if (self.isPaused) {
        self.isPaused = false;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:true];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    else {
        self.isPaused = true;
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(BOOL)workoutComplete {
    if ([self.currentRoundSTRING integerValue] <= self.workout.rounds) {
        return false;
    }
    else {
        return true;
    }
}

-(void)increaseRound {
    self.currentRoundSTRING = [NSString stringWithFormat:@"%ld",[self.currentRoundSTRING integerValue] + 1];
    //If on final round, don't update the round UI (ex: 3/3)
    if ([self.currentRoundSTRING integerValue] <= self.workout.rounds) {
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%@ / %ld", self.currentRoundSTRING, (long) self.currentNumberOfRoundsINT];
    }
}

-(void)resetRoundTimer {
    self.currentRoundTimeINT = self.workout.roundTime;
    self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
}

-(void)resetRestTimer {
    self.currentRestTimeINT = self.workout.restTime;
    self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
}

-(void)incrementRoundTimer {
    self.startDate = [NSDate date];
    self.deltaTime = -floor([self.startDate timeIntervalSinceNow]);
    self.currentRoundTimeINT -= self.deltaTime;
    self.currentRoundTimeSTRING = [self.helper  convertTimeIntegerIntoString:self.currentRoundTimeINT];
}

-(void)incrementRestTimer {
    self.startDate = [NSDate date];
    self.deltaTime = -floor([self.startDate timeIntervalSinceNow]);
    self.currentRestTimeINT -= self.deltaTime;
    self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
}

@end
