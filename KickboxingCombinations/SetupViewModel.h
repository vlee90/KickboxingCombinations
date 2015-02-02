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

@interface SetupViewModel : NSObject

@property(nonatomic, strong) Workout* workout;

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

-(instancetype)initWithPoolProperties;

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

-(NSString*)convertTimeIntegerIntoString:(NSInteger)seconds;

-(void)createWorkout;
-(void)passWorkoutToTimerViewModel:(TimerViewModel*)timerViewModel;
-(TimerViewController*)createTimerViewControllerFromStoryboardWithTimerViewModel;

@end
