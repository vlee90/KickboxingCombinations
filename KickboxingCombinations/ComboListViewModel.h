//
//  ComboListViewModel.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAGContainer.h"

@interface ComboListViewModel : NSObject

@property (weak, nonatomic) TAGContainer *container;
@property (strong, nonatomic) NSString *techOne;
@property (strong, nonatomic) NSString *techTwo;
@property (strong, nonatomic) NSString *techThree;
@property (strong, nonatomic) NSString *techFour;
@property (strong, nonatomic) NSString *techFive;
@property (strong, nonatomic) NSString *techSix;
@property (strong, nonatomic) NSString *techSeven;
@property (strong, nonatomic) NSString *techEight;

-(void)getTAGContainerFromAppDelegate;
-(void)setTechniquesFromContainer;

-(void)buyButtonPressed;

@end
