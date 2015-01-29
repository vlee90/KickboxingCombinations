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
        self.currentNumberOfRounds = 3;
        self.currentRoundTimeINT = 300;
        self.currentRestTimeINT = 60;
        self.currentWarningTimeINT = 10;
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

-(void)typeNegativeIncrement {
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

-(void)numberOfRoundsPositiveIncrement {
    self.currentNumberOfRounds++;
}
-(void)numberOfRoundsNegativeIncrement {
    if(self.currentNumberOfRounds > 1) {
        self.currentNumberOfRounds--;
    }
}

-(void)roundTimePositiveIncrement {
    self.currentRoundTimeINT = self.currentRoundTimeINT + 10;
}

-(void)roundTimeNegativeIncrement {
    if(self.currentRoundTimeINT > 10) {
        self.currentRoundTimeINT = self.currentRoundTimeINT - 10;
    }
}

-(void)roundRestPositiveIncrement {
    self.currentRestTimeINT = self.currentRestTimeINT + 10;
}

-(void)roundRestNegativeIncrement {
    if(self.currentRestTimeINT > 10) {
        self.currentRestTimeINT = self.currentRestTimeINT - 10;
    }
}

-(void)warningTimePositiveIncrement {
    self.currentWarningTimeINT = self.currentWarningTimeINT + 5;
}

-(void)warningTimeNegativeIncrement {
    if(self.currentWarningTimeINT > 5) {
        self.currentWarningTimeINT = self.currentWarningTimeINT - 5;
    }
}

-(NSString *)convertTimeIntegerIntoString:(NSInteger)seconds {
    NSInteger minutes = seconds / 60;
    NSInteger remainingSeconds = seconds % 60;
    NSString* returnString = [NSString stringWithFormat:@"%ld:%ld", minutes, remainingSeconds];
    return returnString;
}

@end
