//
//  TimerViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"

@interface TimerViewModel : NSObject

@property (nonatomic, weak) Workout* workout;

-(instancetype)initWithWorkout:(Workout*)workout;

@end
