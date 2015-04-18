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

@interface WorkoutManager : NSObject

@property (strong, nonatomic) Workout *workout;)

+(instancetype)singleton;

-(Combination *)callCombination;

@end
