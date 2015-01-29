//
//  Workout.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "Workout.h"

@interface Workout()

@end

@implementation Workout

-(instancetype)initWithType:(NSString *)type withRoundTimerOf:(NSInteger)roundTime withRestTimeOf:(NSInteger)restTime withNumberOfRounds:(NSInteger)rounds withCountdownTimer:(NSInteger)countdownTimer {
    _type = type;
    _roundTime = roundTime;
    _restTime = restTime;
    _rounds = rounds;
    _countdownTimer = countdownTimer;
    return self;
}


@end
