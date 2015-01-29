//
//  Workout.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "Workout.h"

@interface Workout()

@property (nonatomic, strong) NSString* type;
@property (nonatomic, strong) NSString* roundTime;
@property (nonatomic, strong) NSString* restTime;
@property NSInteger rounds;
@property NSInteger countdownTimer;

@end

@implementation Workout

-(instancetype)initWithType:(NSString*)type withRoundTimerOf:(NSString*)roundTime withRestTimeOf:(NSString*)restTime withNumberOfRounds:(NSInteger)rounds withCountdownTimer:(NSInteger)countdownTimer {
    if(self = [super init]) {
        _type = type;
        _roundTime = roundTime;
        _restTime = restTime;
        self.rounds = rounds;
        self.countdownTimer = countdownTimer;
    }
    return self;
}


@end
