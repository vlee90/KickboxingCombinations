//
//  TimerViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"
#import "Helper.h"

@interface TimerViewModel : NSObject


//State Properties
@property BOOL roundModeIsOn;
@property BOOL isPaused;
@property (nonatomic, strong) NSString* currentWorkoutType;
@property (nonatomic, strong) NSString* currentNumberOfRoundsSTRING;
@property (nonatomic, strong) NSString* currentRoundTimeSTRING;
@property (nonatomic, strong) NSString* currentRestTimeSTRING;
@property (nonatomic, strong) NSString* currentWarningTimeSTRING;
@property (nonatomic, strong) NSString* currentRoundSTRING;

-(instancetype)initWithWorkoutProperties:(Workout *)workout;

-(void)startButtonPressed;
-(void)updateTimer;
-(BOOL)workoutComplete;
-(void)increaseRound;
-(void)resetRoundTimer;
-(void)resetRestTimer;
-(void)incrementRoundTimer;
-(void)incrementRestTimer;

@end
