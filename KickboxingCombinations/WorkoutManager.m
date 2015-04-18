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
    });
    return sharedInstance;
}

//-(Combination *)callCombination {
//
//    return C
//}

@end
