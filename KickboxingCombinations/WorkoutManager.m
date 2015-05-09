//
//  WorkoutManager.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/18/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "WorkoutManager.h"

@interface WorkoutManager ()

@property (strong, nonatomic) NSArray *combinationList;

@end

@implementation WorkoutManager

+(instancetype)singleton {
    static WorkoutManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.workoutTypeArray = @[@"Beginner", @"Advanced"];
        sharedInstance.workout = [[Workout alloc] initWithType:[sharedInstance.workoutTypeArray objectAtIndex:0]
                                              withRoundTimerOf:300 withRestTimeOf:60 withNumberOfRounds:3 withCountdownTimer:10];
    });
    return sharedInstance;
}

-(void)setWorkoutCombintationList:(NSArray *)comboList {
    self.combinationList = comboList;
}

-(void)callCombination {
    NSInteger comboIndex = arc4random_uniform(self.combinationList.count);
}

@end
