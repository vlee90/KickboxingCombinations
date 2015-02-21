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
    PurchaseItem *aliShuffle = [[PurchaseItem alloc] initWithName:@"Ali Shuffle"
                                                              sku:@"12345"
                                                         category:@"Footwork"
                                                            price:@"5"];
    
    PurchaseItem *tysonShift = [[PurchaseItem alloc] initWithName:@"Tyson Shift"
                                                              sku:@"23456"
                                                         category:@"Footwork"
                                                            price:@"5"];
    
    
    NSMutableArray *purchasedCombinations = [NSMutableArray array];
    [purchasedCombinations addObject:@{@"name" : aliShuffle.name,
                                       @"sku" : aliShuffle.sku,
                                       @"category" : aliShuffle.category,
                                       @"price" : aliShuffle.price,
                                       @"currency" : @"USD",
                                       @"quantity" : @"1"}];
    [purchasedCombinations addObject:@{@"name" : tysonShift.name,
                                       @"sku" : tysonShift.sku,
                                       @"category" : tysonShift.category,
                                       @"price" : tysonShift.price,
                                       @"currency" : @"USD",
                                       @"quantity" : @"1"}];
    NSNumber *total = [NSNumber numberWithFloat:([aliShuffle.price floatValue] + [tysonShift.price floatValue])];
    NSString *totalString = [NSString stringWithFormat:@"%@", total];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"buyCombination",
                      @"transactionId" : @"0000",
                      @"transactionTotal" : totalString,
                      @"transactionAffliation" : @"The Kickboxing App",
                      @"transactionTax" : @"0.01",
                      @"transactionShipping" : @"1",
                      @"transactionCurrency" : @"USD",
                      @"transactionProducts" : purchasedCombinations}];
    
    [dataLayer push:@{@"transactionId" : [NSNull null],
                      @"transactionTotal" : [NSNull null],
                      @"transactionAffliation" : [NSNull null],
                      @"transactionTax" : [NSNull null],
                      @"transactionShipping" : [NSNull null],
                      @"transactionCurrency" : [NSNull null],
                      @"transactionProducts" : [NSNull null]}];
}

@end
