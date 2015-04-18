//
//  TechniqueManager.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TechniqueManager.h"
#import "Workout.h"
#import "Technique.h"
#import "Constants.h"

@interface TechniqueManager ()

@end

@implementation TechniqueManager

+(instancetype)singleton {
    static TechniqueManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.techniqueLists = @[kBOXING, kKICKBOXING];
    });
    return sharedInstance;
}


-(NSArray *)getTechniquesOfType:(NSString *)type {
    NSMutableArray *techniqueList = [NSMutableArray new];
    NSArray *nameArray = [NSArray new];
    if ([type isEqualToString:kBOXING]) {
        nameArray = [self getBoxingTechniqueList];
        for (NSString *name in nameArray) {
            Technique *tech = [[Technique alloc] initWithName:name];
            [techniqueList addObject:tech.name];
        }
    }
    else if ([type isEqualToString:kKICKBOXING]) {
        nameArray = [self getKickboxingTechniqueList];
        for (NSString *name in nameArray) {
            Technique *tech = [[Technique alloc] initWithName:name];
            [techniqueList addObject:tech.name];
        }
    }
    return techniqueList;
}

-(NSArray *)getBoxingTechniqueList {
    NSArray *boxingList = @[kBOXING_TECH_ONE,
                            kBOXING_TECH_TWO,
                            kBOXING_TECH_THREE,
                            kBOXING_TECH_FOUR,
                            kBOXING_TECH_FIVE,
                            kBOXING_TECH_SIX,
                            kBOXING_TECH_SEVEN,
                            kBOXING_TECH_EIGHT];
    return boxingList;
}

-(NSArray *)getKickboxingTechniqueList {
    NSArray *kickboxingList = @[kKICKBOXING_TECH_ONE,
                                kKICKBOXING_TECH_TWO,
                                kKICKBOXING_TECH_THREE,
                                kKICKBOXING_TECH_FOUR,
                                kKICKBOXING_TECH_FIVE,
                                kKICKBOXING_TECH_SIX,
                                kKICKBOXING_TECH_SEVEN,
                                kKICKBOXING_TECH_EIGHT];
    return kickboxingList;
}

@end
