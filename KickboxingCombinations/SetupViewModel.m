//
//  SetupViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewModel.h"

@implementation SetupViewModel

-(instancetype)initWithStateProperties {
    if (self = [super init]) {
        self.helper = [[Helper alloc] init];
        self.typeArray = @[@"Beginner", @"Advanced"];
        self.currentWorkoutType = [self.typeArray objectAtIndex:0];
        self.currentNumberOfRoundsINT = 3;
        self.currentRoundTimeINT = 300;
        self.currentRestTimeINT = 60;
        self.currentWarningTimeINT = 10;
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld",(long)self.currentNumberOfRoundsINT];
        self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
        self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
    return self;
}

-(void)createTimerViewControllerFromStoryboardWithTimerViewModel {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TimerViewController* timerViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimerViewController"];
    TimerViewModel* timerViewModel = [[TimerViewModel alloc] initWithWorkoutProperties:self.workout];
    timerViewController.timerViewModel = timerViewModel;
    self.timerViewController = timerViewController;
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

-(void)loadImagesIntoBackgroundArray {
    self.backgroundArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 1; i <= 132 ; i++) {
        NSString* imageName = [NSString stringWithFormat:@"bag-%ld", (long)i];
        UIImage* image = [UIImage imageNamed:imageName];
        [self.backgroundArray addObject:image];
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
    self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
}

-(void)roundTimeNegativeIncrement {
    if(self.currentRoundTimeINT > 10) {
        self.currentRoundTimeINT = self.currentRoundTimeINT - 10;
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
    }
}

-(void)roundRestPositiveIncrement {
    self.currentRestTimeINT = self.currentRestTimeINT + 10;
    self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
}

-(void)roundRestNegativeIncrement {
    if(self.currentRestTimeINT > 10) {
        self.currentRestTimeINT = self.currentRestTimeINT - 10;
        self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
    }
}

-(void)warningTimePositiveIncrement {
    self.currentWarningTimeINT = self.currentWarningTimeINT + 5;
    self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
}

-(void)warningTimeNegativeIncrement {
    if(self.currentWarningTimeINT > 5) {
        self.currentWarningTimeINT = self.currentWarningTimeINT - 5;
        self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
}

@end
