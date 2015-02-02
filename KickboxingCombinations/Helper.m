//
//  Helper.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/2/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "Helper.h"

@implementation Helper

-(NSString *)convertTimeIntegerIntoString:(NSInteger)seconds {
    NSInteger minutes = seconds / 60;
    NSInteger remainingSeconds = seconds % 60;
    NSString* returnString = [NSString stringWithFormat:@"%ld:%02ld", (long)minutes, (long)remainingSeconds];
    return returnString;
}

@end
