//
//  SetupViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewModel.h"

@implementation SetupViewModel

-(void)createWorkoutOfType:(NSString *)type withRoundLengthOf:(NSString *)roundLength withRestBetweenRounds:(NSString *)rest withNumberOfRounds:(NSInteger)rounds withCountdownRingerStartingAt:(NSInteger)countdownTime {
    self.workout = [[Workout alloc] initWithType:type
                                    withRoundTimerOf:roundLength
                                    withRestTimeOf:rest
                                    withNumberOfRounds:rounds
                                    withCountdownTimer:countdownTime];
}

@end
