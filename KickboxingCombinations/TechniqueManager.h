//
//  TechniqueManager.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

//  Goal of this class is to retrieve technique lists and combinations
@interface TechniqueManager : NSObject

+(instancetype)singleton;

@property (strong, nonatomic) NSArray *techniqueLists;

-(NSArray *)getTechniquesOfType:(NSString *)type;

@end
