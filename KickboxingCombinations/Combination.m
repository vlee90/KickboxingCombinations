//
//  Combination.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "Combination.h"

@implementation Combination

-(instancetype)initWithName:(NSString *)name andTechniques:(NSArray *)techniques {
    if (self = [super init]) {
        self.name = name;
        self.technqiues = techniques;
    }
    return self;
}

@end
