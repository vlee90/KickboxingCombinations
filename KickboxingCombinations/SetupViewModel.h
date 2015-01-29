//
//  SetupViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"

@interface SetupViewModel : NSObject

@property(nonatomic, strong) Workout* workout;

//Pool Properties
@property (nonatomic, strong) NSArray* typeArray;

//State Properties
@property (nonatomic, strong) NSString* currentWorkoutType;
@property NSInteger currentNumberOfRounds;

-(instancetype)initWithPoolProperties;

-(void)createWorkoutOfType:(NSString*)type withRoundLengthOf:(NSString*)roundLength withRestBetweenRounds:(NSString*)rest withNumberOfRounds:(NSInteger)rounds withCountdownRingerStartingAt:(NSInteger)countdownTime;

-(void)typePositiveIncrement;
-(void)typeNegativeIncrement;
-(void)numberOfRoundsPositiveIncrement;
-(void)numberOfRoundsNegativeIncrement;

@end
