//
//  Combination.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Combination : NSObject
// Combinations should contain:
/*
 name
 array of techniques
 sound (or way to play sound)
 */

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *technqiues;
@end
