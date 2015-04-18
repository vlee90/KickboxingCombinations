//
//  ComboListTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComboListViewModel.h"

@interface ComboListTests : XCTestCase

@property (strong, nonatomic) ComboListViewModel *comboListViewModel;

@end

@implementation ComboListTests

- (void)setUp {
    [super setUp];
    self.comboListViewModel = [[ComboListViewModel alloc] init];
}

- (void)tearDown {
    self.comboListViewModel = nil;
    [super tearDown];
}

- (void)testSetComboList {
    
}

-(void)testRightListButtonPressed {
    
}

-(void)testLeftListButtonPressed {
    
}

@end
