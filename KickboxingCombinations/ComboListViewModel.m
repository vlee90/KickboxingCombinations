//
//  ComboListViewModel.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ComboListViewModel.h"
#import "AppDelegate.h"
#import "TAGDataLayer.h"
#import "TAGManager.h"
#import "PurchaseItem.h"
#import "Technique.h"

@implementation ComboListViewModel

-(void)getTAGContainerFromAppDelegate {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.container = appDelegate.container;
}

-(void)setTechniquesFromContainer {
    if (self.container != nil) {
        self.techOne = [self.container stringForKey:@"techOne"];
        self.techTwo= [self.container stringForKey:@"techTwo"];
        self.techThree = [self.container stringForKey:@"techThree"];
        self.techFour = [self.container stringForKey:@"techFour"];
        self.techFive = [self.container stringForKey:@"techFive"];
        self.techSix = [self.container stringForKey:@"techSix"];
        self.techSeven = [self.container stringForKey:@"techSeven"];
        self.techEight = [self.container stringForKey:@"techEight"];
    }
    else {
        [self getTAGContainerFromAppDelegate];
    }
}

-(void)buyButtonPressed {
    PurchaseItem *aliShuffle = 
    NSMutableArray *purchasedCombinations = [NSMutableArray array];
    [purchasedCombinations addObject:@{@"name" : @"Ali Shuffle",
                                       @"sku" : @"12345",
                                       @"category" : @"Footwork",
                                       @"price" : @"5",
                                       @"currency" : @"USD",
                                       @"quantity" : @"1"];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"buyCombination"}];
}

@end
