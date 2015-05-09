//
//  SetupViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewModel.h"
#import "Helper.h"
#import "WorkoutManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SetupViewModel ()

@property(nonatomic, strong) Helper* helper;
@property NSInteger currentNumberOfRoundsINT;
@property NSInteger currentRoundTimeINT;
@property NSInteger currentRestTimeINT;
@property NSInteger currentWarningTimeINT;
@property (strong, nonatomic) NSArray *typeArray;
@end

@implementation SetupViewModel

-(instancetype)initWithStateProperties {
    if (self = [super init]) {
        self.helper = [[Helper alloc] init];
        self.typeArray = [WorkoutManager singleton].workoutTypeArray;
        self.currentWorkoutType = [[WorkoutManager singleton].workoutTypeArray objectAtIndex:0];
        self.currentNumberOfRoundsINT = [WorkoutManager singleton].workout.rounds;
        self.currentRoundTimeINT = [WorkoutManager singleton].workout.roundTime;
        self.currentRestTimeINT = [WorkoutManager singleton].workout.restTime;
        self.currentWarningTimeINT = [WorkoutManager singleton].workout.countdownTimer;
        [self updateINTtoSTRING];
        RAC(self, currentNumberOfRoundsINT) = RACObserve([WorkoutManager singleton].workout, rounds);
        RAC(self, currentRoundTimeINT) = RACObserve([WorkoutManager singleton].workout, roundTime);
        RAC(self, currentRestTimeINT) = RACObserve([WorkoutManager singleton].workout, restTime);
        RAC(self, currentWarningTimeINT) = RACObserve([WorkoutManager singleton].workout, countdownTimer);
        RAC(self, currentWorkoutType) = RACObserve([WorkoutManager singleton].workout, type);
    }
    return self;
}

-(TimerViewController*)createTimerViewControllerFromStoryboardWithTimerViewModel {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TimerViewController* timerViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimerViewController"];
    TimerViewModel* timerViewModel = [[TimerViewModel alloc] initWithWorkoutProperties:[WorkoutManager singleton].workout];
    timerViewController.timerViewModel = timerViewModel;
    return timerViewController;
}

-(ComboListViewController*)createComboListViewControllerFromStoryboardWithComboViewModel {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ComboListViewController *comboListViewController = [storyboard instantiateViewControllerWithIdentifier:@"ComboListViewController"];
    ComboListViewModel *comboListViewModel = [[ComboListViewModel alloc] init];
    comboListViewController.comboListViewModel = comboListViewModel;
    return comboListViewController;
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
-(void)updateINTtoSTRING {
    self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld",(long)self.currentNumberOfRoundsINT];
    self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
    self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
    self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
}

-(void)numberOfRoundsPositiveIncrement {
    self.currentNumberOfRoundsINT++;
    [self updateINTtoSTRING];
}
-(void)numberOfRoundsNegativeIncrement {
    if(self.currentNumberOfRoundsINT > 1) {
        self.currentNumberOfRoundsINT--;
        [self updateINTtoSTRING];
    }
}

-(void)roundTimePositiveIncrement {
    self.currentRoundTimeINT = self.currentRoundTimeINT + 10;
    [self updateINTtoSTRING];
}

-(void)roundTimeNegativeIncrement {
    if(self.currentRoundTimeINT > 10) {
        self.currentRoundTimeINT = self.currentRoundTimeINT - 10;
        [self updateINTtoSTRING];
    }
}

-(void)roundRestPositiveIncrement {
    self.currentRestTimeINT = self.currentRestTimeINT + 10;
    [self updateINTtoSTRING];
}

-(void)roundRestNegativeIncrement {
    if(self.currentRestTimeINT > 10) {
        self.currentRestTimeINT = self.currentRestTimeINT - 10;
        [self updateINTtoSTRING];
    }
}

-(void)warningTimePositiveIncrement {
    self.currentWarningTimeINT = self.currentWarningTimeINT + 5;
    [self updateINTtoSTRING];
}

-(void)warningTimeNegativeIncrement {
    if(self.currentWarningTimeINT > 5) {
        self.currentWarningTimeINT = self.currentWarningTimeINT - 5;
        [self updateINTtoSTRING];
    }
}

@end
