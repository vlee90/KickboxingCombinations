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

@interface SetupViewModel ()

@property(nonatomic, strong) Helper* helper;
@property NSInteger currentNumberOfRoundsINT;
@property NSInteger currentRoundTimeINT;
@property NSInteger currentRestTimeINT;
@property NSInteger currentWarningTimeINT;
//Backed Properties
@property (nonatomic, strong) NSArray* typeArray;
@end

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
        [self updateINTtoSTRING];
        [self createWorkout];
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



-(void)createWorkout {
    [WorkoutManager singleton].workout = [[Workout alloc] initWithType:self.currentWorkoutType withRoundTimerOf:self.currentRoundTimeINT withRestTimeOf:self.currentRestTimeINT withNumberOfRounds:self.currentNumberOfRoundsINT withCountdownTimer:self.currentWarningTimeINT];
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
