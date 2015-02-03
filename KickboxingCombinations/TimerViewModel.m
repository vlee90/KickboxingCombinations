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
        self.roundTimerOn = false;
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
    if (self.roundTimerOn == true && [self workoutComplete] == false) {
        if (self.currentRoundTimeINT > 0) {
            [self incrementRoundTimer];
        }
        else {
            self.roundTimerOn = false;
            [self resetRestTimer];
            [self resetRestTimer];
        }
    }
    //Rest Mode
    else if (self.roundTimerOn == false && [self workoutComplete] == false) {
        if (self.currentRestTimeINT > 0) {
            [self incrementRestTimer];
        }
        else {
            [self increaseRound];
            self.roundTimerOn = true;
            [self resetRoundTimer];
            [self resetRestTimer];
        }
    }
    //End of workout
    else {
        NSLog(@"End Workout");
        [self.timer invalidate];
        self.timer = nil;
    }
}

-(void)beginRoundCountdownTimer {
    if (self.isPaused) {
        self.isPaused = false;
        //Starts round or rest depending on self.roundTimerOn
//        if(self.roundTimerOn == false) {
            self.roundTimerOn = true;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:true];
            [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//        }
//        else {
//            
//        }
    }
    else {
        //Pauses round or rest depending on self.roundTimerOn
        self.isPaused = true;
        [self.timer invalidate];
        self.timer = nil;
        
//        if(self.roundTimerOn) {
//        }
//        else {
//        }
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
    if ([self.currentRoundSTRING integerValue] < self.workout.rounds) {
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
