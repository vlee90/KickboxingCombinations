//
//  SetupViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewModel.h"

@implementation SetupViewModel

-(instancetype)initWithPoolProperties {
    if (self = [super init]) {
        self.typeArray = @[@"Beginner", @"Advanced"];
        self.currentWorkoutType = [self.typeArray objectAtIndex:0];
    }
    return self;
}

-(void)createWorkoutOfType:(NSString *)type withRoundLengthOf:(NSString *)roundLength withRestBetweenRounds:(NSString *)rest withNumberOfRounds:(NSInteger)rounds withCountdownRingerStartingAt:(NSInteger)countdownTime {
    self.workout = [[Workout alloc] initWithType:type
                                    withRoundTimerOf:roundLength
                                    withRestTimeOf:rest
                                    withNumberOfRounds:rounds
                                    withCountdownTimer:countdownTime];
}

-(void)typePositiveIncrement {
    NSInteger currentIndex = [self.typeArray indexOfObject:self.currentWorkoutType];
    switch(currentIndex) {
        case 0:
            self.currentWorkoutType = [self.typeArray objectAtIndex:1];
            break;
        default:
            self.currentWorkoutType = [self.typeArray objectAtIndex:0];
            break;
    }
}

@end
