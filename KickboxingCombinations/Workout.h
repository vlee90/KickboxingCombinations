//
//  Workout.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject

-(instancetype)initWithType:(NSString*)type withRoundTimerOf:(NSString*)roundTime withRestTimeOf:(NSString*)restTime withNumberOfRounds:(NSInteger)rounds withCountdownTimer:(NSInteger)countdownTimer;


@end
