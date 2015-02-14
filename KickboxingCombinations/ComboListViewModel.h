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
@property (strong, nonatomic) NSString *techTwo;

-(void)getTAGContainerFromAppDelegate;
-(void)setTechTwoFromContainer;

@end
