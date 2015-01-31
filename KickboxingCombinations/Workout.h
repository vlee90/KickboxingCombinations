//
//  Workout.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject

@property (nonatomic, strong) NSString* type;
@property NSInteger roundTime;
@property NSInteger restTime;
@property NSInteger rounds;
@property NSInteger countdownTimer;

-(instancetype)initWithType:(NSString*)type withRoundTimerOf:(NSInteger)roundTime withRestTimeOf:(NSInteger)restTime withNumberOfRounds:(NSInteger)rounds withCountdownTimer:(NSInteger)countdownTimer;


@end
