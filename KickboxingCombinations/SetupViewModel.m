//
//  SetupViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewModel.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

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

-(TimerViewController*)createTimerViewControllerFromStoryboardWithTimerViewModel {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TimerViewController* timerViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimerViewController"];
    TimerViewModel* timerViewModel = [[TimerViewModel alloc] initWithWorkoutProperties:self.workout];
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
    self.workout = [[Workout alloc] initWithType:self.currentWorkoutType withRoundTimerOf:self.currentRoundTimeINT withRestTimeOf:self.currentRestTimeINT withNumberOfRounds:self.currentNumberOfRoundsINT withCountdownTimer:self.currentWarningTimeINT];
}

-(void)typePositiveIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Positive Type"
                                                           label:nil
                                                           value:@1] build]];
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
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Negative Type"
                                                           label:nil
                                                           value:@1] build]];
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
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Positive Round#"
                                                           label:nil
                                                           value:@1] build]];
    self.currentNumberOfRoundsINT++;
    self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld", (long)self.currentNumberOfRoundsINT];
}
-(void)numberOfRoundsNegativeIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Negative Round#"
                                                           label:nil
                                                           value:@1] build]];
    if(self.currentNumberOfRoundsINT > 1) {
        self.currentNumberOfRoundsINT--;
        self.currentNumberOfRoundsSTRING = [NSString stringWithFormat:@"%ld", (long)self.currentNumberOfRoundsINT];
    }
}

-(void)roundTimePositiveIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Positive Round Time"
                                                           label:nil
                                                           value:@1] build]];
    self.currentRoundTimeINT = self.currentRoundTimeINT + 10;
    self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
}

-(void)roundTimeNegativeIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Negative Round Time"
                                                           label:nil
                                                           value:@1] build]];
    if(self.currentRoundTimeINT > 10) {
        self.currentRoundTimeINT = self.currentRoundTimeINT - 10;
        self.currentRoundTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRoundTimeINT];
    }
}

-(void)roundRestPositiveIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Positive Rest Time"
                                                           label:nil
                                                           value:@1] build]];
    self.currentRestTimeINT = self.currentRestTimeINT + 10;
    self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
}

-(void)roundRestNegativeIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Negative Rest Time"
                                                           label:nil
                                                           value:@1] build]];
    if(self.currentRestTimeINT > 10) {
        self.currentRestTimeINT = self.currentRestTimeINT - 10;
        self.currentRestTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentRestTimeINT];
    }
}

-(void)warningTimePositiveIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Positive Warning Time"
                                                           label:nil
                                                           value:@1] build]];
    self.currentWarningTimeINT = self.currentWarningTimeINT + 5;
    self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
}

-(void)warningTimeNegativeIncrement {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Setup"
                                                          action:@"Increment Negative Warning Time"
                                                           label:nil
                                                           value:@1] build]];
    if(self.currentWarningTimeINT > 5) {
        self.currentWarningTimeINT = self.currentWarningTimeINT - 5;
        self.currentWarningTimeSTRING = [self.helper convertTimeIntegerIntoString:self.currentWarningTimeINT];
    }
}

@end
