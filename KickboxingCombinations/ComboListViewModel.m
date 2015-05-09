//
//  ComboListViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ComboListViewModel.h"
#import "TechniqueManager.h"
#import "Constants.h"
#import "WorkoutManager.h"

@interface ComboListViewModel ()

//@property (strong, nonatomic) NSString *listName;

@end

@implementation ComboListViewModel

-(instancetype)init {
    if (self = [super init]) {
        self.listName = kBOXING;
        RAC([TechniqueManager singleton], techniqueType) = RACObserve(self, listName);
    }
    return self;
}

-(void)listLeftButtonPressed {
    NSInteger currentIndex = [[TechniqueManager singleton].techniqueLists indexOfObject:self.listName];
    if (currentIndex == 0) {
        self.listName = [[TechniqueManager singleton].techniqueLists objectAtIndex:[TechniqueManager singleton].techniqueLists.count - 1];
        [self setTechniqueLabelsWithList:self.listName];
    }
    else {
        self.listName = [[TechniqueManager singleton].techniqueLists objectAtIndex:(currentIndex - 1)];
        [self setTechniqueLabelsWithList:self.listName];
    }
}

-(void)listRightButtonPressed {
    NSInteger currentIndex = [[TechniqueManager singleton].techniqueLists indexOfObject:self.listName];
    if (currentIndex == [TechniqueManager singleton].techniqueLists.count - 1) {
        self.listName = [[TechniqueManager singleton].techniqueLists objectAtIndex:0];
        [self setTechniqueLabelsWithList:self.listName];
    }
    else {
        self.listName = [[TechniqueManager singleton].techniqueLists objectAtIndex:(currentIndex + 1)];
        [self setTechniqueLabelsWithList:self.listName];
    }
}


-(void)setTechniqueLabelsWithList:(NSString *)kListType {
    NSArray *techniqueList = [[TechniqueManager singleton] getTechniques];
    self.techOne = [NSString stringWithFormat:@"1) %@",[techniqueList objectAtIndex:0]];
    self.techTwo = [NSString stringWithFormat:@"2) %@",[techniqueList objectAtIndex:1]];
    self.techThree = [NSString stringWithFormat:@"3) %@",[techniqueList objectAtIndex:2]];
    self.techFour = [NSString stringWithFormat:@"4) %@",[techniqueList objectAtIndex:3]];
    self.techFive = [NSString stringWithFormat:@"5) %@",[techniqueList objectAtIndex:4]];
    self.techSix = [NSString stringWithFormat:@"6) %@",[techniqueList objectAtIndex:5]];
    self.techSeven = [NSString stringWithFormat:@"7) %@",[techniqueList objectAtIndex:6]];
    self.techEight = [NSString stringWithFormat:@"8) %@",[techniqueList objectAtIndex:7]];
}

@end
