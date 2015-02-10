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
#import "Helper.h"

@interface SetupViewModel : NSObject

@property(nonatomic, strong) Workout* workout;
@property(nonatomic, strong) Helper* helper;

//Backed Properties
@property (nonatomic, strong) NSArray* typeArray;
@property (nonatomic, strong) NSMutableArray* backgroundArray;

//State Properties
@property (nonatomic, strong) NSString* currentWorkoutType;
@property NSInteger currentNumberOfRoundsINT;
@property NSInteger currentRoundTimeINT;
@property NSInteger currentRestTimeINT;
@property NSInteger currentWarningTimeINT;

@property (nonatomic, strong) NSString* currentNumberOfRoundsSTRING;
@property (nonatomic, strong) NSString* currentRoundTimeSTRING;
@property (nonatomic, strong) NSString* currentRestTimeSTRING;
@property (nonatomic, strong) NSString* currentWarningTimeSTRING;

@property (nonatomic, strong) TimerViewController* timerViewController;

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

-(void)loadImagesIntoBackgroundArray;

-(void)createWorkout;
-(void)createTimerViewControllerFromStoryboardWithTimerViewModel;

@end
