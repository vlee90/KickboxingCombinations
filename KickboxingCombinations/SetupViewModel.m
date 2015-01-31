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
        self.currentNumberOfRoundsINT = 3;
        self.currentRoundTimeINT = 300;
        self.currentRestTimeINT = 60;
        self.currentWarningTimeINT = 10;
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld",(long)self.currentNumberOfRoundsINT];
        self.currentRestTimeSTRING = [self convertTimeIntegerIntoString:self.currentRestTimeINT];
        self.currentRoundTimeSTRING = [self convertTimeIntegerIntoString:self.currentRoundTimeINT];
        self.currentWarningTimeSTRING = [self convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
    return self;
}

-(void)createWorkout {
    self.workout = [[Workout alloc] initWithType:self.currentWorkoutType withRoundTimerOf:self.currentRoundTimeINT withRestTimeOf:self.currentRestTimeINT withNumberOfRounds:self.currentNumberOfRoundsINT withCountdownTimer:self.currentWarningTimeINT];
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
    self.currentNumberOfRoundsINT++;
    self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld", (long)self.currentNumberOfRoundsINT];
}
-(void)numberOfRoundsNegativeIncrement {
    if(self.currentNumberOfRoundsINT > 1) {
        self.currentNumberOfRoundsINT--;
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld", (long)self.currentNumberOfRoundsINT];
    }
}

-(void)roundTimePositiveIncrement {
    self.currentRoundTimeINT = self.currentRoundTimeINT + 10;
    self.currentRoundTimeSTRING = [self convertTimeIntegerIntoString:self.currentRoundTimeINT];
}

-(void)roundTimeNegativeIncrement {
    if(self.currentRoundTimeINT > 10) {
        self.currentRoundTimeINT = self.currentRoundTimeINT - 10;
        self.currentRoundTimeSTRING = [self convertTimeIntegerIntoString:self.currentRoundTimeINT];
    }
}

-(void)roundRestPositiveIncrement {
    self.currentRestTimeINT = self.currentRestTimeINT + 10;
    self.currentRestTimeSTRING = [self convertTimeIntegerIntoString:self.currentRestTimeINT];
}

-(void)roundRestNegativeIncrement {
    if(self.currentRestTimeINT > 10) {
        self.currentRestTimeINT = self.currentRestTimeINT - 10;
        self.currentRestTimeSTRING = [self convertTimeIntegerIntoString:self.currentRestTimeINT];
    }
}

-(void)warningTimePositiveIncrement {
    self.currentWarningTimeINT = self.currentWarningTimeINT + 5;
    self.currentWarningTimeSTRING = [self convertTimeIntegerIntoString:self.currentWarningTimeINT];
}

-(void)warningTimeNegativeIncrement {
    if(self.currentWarningTimeINT > 5) {
        self.currentWarningTimeINT = self.currentWarningTimeINT - 5;
        self.currentWarningTimeSTRING = [self convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
}

-(NSString *)convertTimeIntegerIntoString:(NSInteger)seconds {
    NSInteger minutes = seconds / 60;
    NSInteger remainingSeconds = seconds % 60;
    NSString* returnString = [NSString stringWithFormat:@"%ld:%02ld", (long)minutes, (long)remainingSeconds];
    return returnString;
}

@end
