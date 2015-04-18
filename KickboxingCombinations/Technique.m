//
//  Technique.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "Technique.h"

@implementation Technique

-(instancetype)initWithName:(NSString *)name {
    if (self == [super init]) {
        self.name = name;
    }
    return self;
}

@end
