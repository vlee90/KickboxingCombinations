//
//  ComboListViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComboListViewModel : NSObject

@property (strong, nonatomic) NSString *techOne;
@property (strong, nonatomic) NSString *techTwo;
@property (strong, nonatomic) NSString *techThree;
@property (strong, nonatomic) NSString *techFour;
@property (strong, nonatomic) NSString *techFive;
@property (strong, nonatomic) NSString *techSix;
@property (strong, nonatomic) NSString *techSeven;
@property (strong, nonatomic) NSString *techEight;
@property (strong, nonatomic) NSString *listName;

-(instancetype)init;
-(void)setTechniqueLabelsWithList:(NSString *)kListType;
-(void)listRightButtonPressed;
-(void)listLeftButtonPressed;

@end
