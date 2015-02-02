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

@property (nonatomic, strong) Workout* workout;
@property (nonatomic, strong) Helper* helper;

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

-(instancetype)initWithWorkoutProperties:(Workout*)workout;

@end
