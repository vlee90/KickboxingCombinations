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

-(void)createWorkoutOfType:(NSString*)type withRoundLengthOf:(NSString*)roundLength withRestBetweenRounds:(NSString*)rest withNumberOfRounds:(NSInteger)rounds withCountdownRingerStartingAt:(NSInteger)countdownTime;

@end
