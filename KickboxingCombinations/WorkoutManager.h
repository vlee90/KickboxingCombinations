//
//  WorkoutManager.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/18/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Combination.h"
#import "Workout.h"

//  Given an array of combintations - this should be able to fire off workout cominbations.
//  I don't want this class to communicate at all with the technique manager. They will pass information to each other via the viewModels.
@interface WorkoutManager : NSObject

@property (strong, nonatomic) Workout *workout;
@property (strong, nonatomic) NSArray *workoutTypeArray;

+(instancetype)singleton;

-(void)setWorkoutCombintationList:(NSArray *)comboList;
-(void)callCombination;

@end
