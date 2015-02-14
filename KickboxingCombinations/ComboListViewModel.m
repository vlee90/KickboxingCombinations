//
//  ComboListViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ComboListViewModel.h"
#import "AppDelegate.h"

@implementation ComboListViewModel

-(void)getTAGContainerFromAppDelegate {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.container = appDelegate.container;
}

-(void)setTechTwoFromContainer {
    if (self.container != nil) {
        NSString *techTwoFromContainer = [self.container stringForKey:@"techTwoLeadStraight"];
        NSLog(@"Tech: %@", techTwoFromContainer);
        self.techTwo = techTwoFromContainer;
    }
    else {
        [self getTAGContainerFromAppDelegate];
    }
}

@end
