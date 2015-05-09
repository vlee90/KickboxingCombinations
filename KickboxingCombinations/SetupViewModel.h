//
//  SetupViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"
#import "TimerViewModel.h"
#import "TimerViewController.h"

#import "ComboListViewController.h"
#import "ComboListViewModel.h"

@interface SetupViewModel : NSObject

//State Properties
@property (nonatomic, strong) NSString* currentWorkoutType;
@property (nonatomic, strong) NSString* currentNumberOfRoundsSTRING;
@property (nonatomic, strong) NSString* currentRoundTimeSTRING;
@property (nonatomic, strong) NSString* currentRestTimeSTRING;
@property (nonatomic, strong) NSString* currentWarningTimeSTRING;

-(instancetype)initWithStateProperties;

-(void)typePositiveIncrement;
-(void)typeNegativeIncrement;
-(void)numberOfRoundsPositiveIncrement;
-(void)numberOfRoundsNegativeIncrement;
-(void)roundTimePositiveIncrement;
-(void)roundTimeNegativeIncrement;
-(void)roundRestPositiveIncrement;
-(void)roundRestNegativeIncrement;
-(void)warningTimePositiveIncrement;
-(void)warningTimeNegativeIncrement;

-(TimerViewController*)createTimerViewControllerFromStoryboardWithTimerViewModel;
-(ComboListViewController*)createComboListViewControllerFromStoryboardWithComboViewModel;

@end
