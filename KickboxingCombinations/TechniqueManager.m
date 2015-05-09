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
#import "Combination.h"

@interface TechniqueManager ()

@end

@implementation TechniqueManager

+(instancetype)singleton {
    static TechniqueManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.techniqueLists = @[kBOXING, kKICKBOXING];
        sharedInstance.techniqueType = [sharedInstance.techniqueLists objectAtIndex:0];
    });
    return sharedInstance;
}


-(NSArray *)getTechniques {
    NSMutableArray *techniqueList = [NSMutableArray new];
    NSArray *nameArray = [NSArray new];
    if ([self.techniqueType isEqualToString:kBOXING]) {
        nameArray = [self getBoxingTechniqueList];
        for (NSString *name in nameArray) {
            Technique *tech = [[Technique alloc] initWithName:name];
            [techniqueList addObject:tech.name];
        }
    }
    else if ([self.techniqueType isEqualToString:kKICKBOXING]) {
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

-(NSArray *)getCombinations {
    if ([self.techniqueType isEqualToString:kBOXING]) {
        return [self getBoxingCombinations];
    }
    else if ([self.techniqueType isEqualToString:kKICKBOXING]) {
        return [self getKickboxingCombinations];
    }
    return @[];
}

#pragma mark Boxing Combinations
-(NSArray *)getBoxingCombinations {
    NSMutableArray *combos = [NSMutableArray new];
    Technique *techOne = [[Technique alloc] initWithName:kBOXING_TECH_ONE];
    Technique *techTwo = [[Technique alloc] initWithName:kBOXING_TECH_TWO];
    Technique *techThree = [[Technique alloc] initWithName:kBOXING_TECH_THREE];
    Technique *techFour = [[Technique alloc] initWithName:kBOXING_TECH_FOUR];
    Technique *techFive = [[Technique alloc] initWithName:kBOXING_TECH_FIVE];
    Technique *techSix = [[Technique alloc] initWithName:kBOXING_TECH_SIX];
    Technique *techSeven = [[Technique alloc] initWithName:kBOXING_TECH_SEVEN];
    Technique *techEight = [[Technique alloc] initWithName:kBOXING_TECH_EIGHT];
    //Build One
    Combination *comboOne =  [[Combination alloc] initWithName:@"Jab-Cross"
                                                 andTechniques:@[techOne,
                                                                 techTwo]];
    [combos addObject:comboOne];
    Combination *comboTwo =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techThree]];
    [combos addObject:comboTwo];
    Combination *comboThree =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook-RightHook"
                                                   andTechniques:@[techOne,
                                                                   techTwo,
                                                                   techThree,
                                                                   techFour]];
    [combos addObject:comboThree];
    Combination *comboFour =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook-RightHook-LeftUppercut"
                                                  andTechniques:@[techOne,
                                                                  techTwo,
                                                                  techThree,
                                                                  techFour,
                                                                  techFive]];
    [combos addObject:comboFour];
    Combination *comboFive =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook-RightHook-LeftUppercut-RightUppercut"
                                                  andTechniques:@[techOne,
                                                                  techTwo,
                                                                  techThree,
                                                                  techFour,
                                                                  techFive,
                                                                  techSix]];
    [combos addObject:comboFive];
    //Build Two
    Combination *comboSix =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook-RightUppercut"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techThree,
                                                                 techSix]];
    [combos addObject:comboSix];
    //Build Three
    Combination *comboSeven =  [[Combination alloc] initWithName:@"Jab-Cross-LeftUpperCut"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techFive]];
    [combos addObject:comboSeven];
    Combination *comboEight =  [[Combination alloc] initWithName:@"Jab-Cross-LeftUpperCut-Cross"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techFive,
                                                                 techTwo]];
    [combos addObject:comboEight];
    //Build Four
    Combination *comboNine = [[Combination alloc] initWithName:@"Jab-Cross-BodyLeftHook"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techSeven]];
    [combos addObject:comboNine];
    //Build Five
    Combination *comboTen = [[Combination alloc] initWithName:@"Jab-OverhandRight"
                                                andTechniques:@[techOne,
                                                                techEight]];
    [combos addObject:comboTen];
    return combos;
}

#pragma mark Kickboxing Combinations
-(NSArray *)getKickboxingCombinations {
    NSMutableArray *combos = [NSMutableArray new];
    Technique *techOne = [[Technique alloc] initWithName:kKICKBOXING_TECH_ONE];
    Technique *techTwo = [[Technique alloc] initWithName:kKICKBOXING_TECH_TWO];
    Technique *techThree = [[Technique alloc] initWithName:kKICKBOXING_TECH_THREE];
    Technique *techFour = [[Technique alloc] initWithName:kKICKBOXING_TECH_FOUR];
    Technique *techFive = [[Technique alloc] initWithName:kKICKBOXING_TECH_FIVE];
    Technique *techSix = [[Technique alloc] initWithName:kKICKBOXING_TECH_SIX];
    Technique *techSeven = [[Technique alloc] initWithName:kKICKBOXING_TECH_SEVEN];
    Technique *techEight = [[Technique alloc] initWithName:kKICKBOXING_TECH_EIGHT];
    //Build One
    Combination *comboOne =  [[Combination alloc] initWithName:@"Jab-Cross"
                                                 andTechniques:@[techOne,
                                                                 techTwo]];
    [combos addObject:comboOne];
    Combination *comboTwo =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook"
                                                 andTechniques:@[techOne,
                                                                 techTwo,
                                                                 techThree]];
    [combos addObject:comboTwo];
    Combination *comboThree =  [[Combination alloc] initWithName:@"Jab-Cross-LeftHook-RightUpperCut"
                                                   andTechniques:@[techOne,
                                                                   techTwo,
                                                                   techThree,
                                                                   techFour]];
    [combos addObject:comboThree];
    //Build Two
    Combination *comboFour =  [[Combination alloc] initWithName:@"Jab-LegKick"
                                                  andTechniques:@[techOne,
                                                                  techSix]];
    [combos addObject:comboFour];
    //Build Three
    Combination *comboFive =  [[Combination alloc] initWithName:@"Jab-Cross-SwitchKick"
                                                  andTechniques:@[techOne,
                                                                  techTwo,
                                                                  techSeven]];
    [combos addObject:comboFive];

    Combination *comboSix =  [[Combination alloc] initWithName:@"Jab-Cross-HeadKick"
                                                 andTechniques:@[techOne,
                                                                 techEight]];
    [combos addObject:comboSix];
    //Build Three
    Combination *comboSeven =  [[Combination alloc] initWithName:@"InsideLegKick-HeadKick"
                                                   andTechniques:@[techFive,
                                                                   techEight]];
    [combos addObject:comboSeven];
    return combos;
}
@end
