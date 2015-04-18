//
//  TechniqueManagerTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 4/17/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TechniqueManager.h"
#import "Constants.h"
@interface TechniqueManager (Testing)

-(NSArray *)getTechniquesOfType:(NSString *)type;
-(NSArray *)getBoxingTechniqueList;
-(NSArray *)getKickboxingTechniqueList;

@end

@interface TechniqueManagerTests : XCTestCase

@property (strong, nonatomic) TechniqueManager *manager;

@end

@implementation TechniqueManagerTests

- (void)setUp {
    [super setUp];
    self.manager = [TechniqueManager new];
}

- (void)tearDown {
    self.manager = nil;
    [super tearDown];
}

- (void)testGetTechniquesOfTypeBoxingHasEightCount {
    NSArray *boxingTech = [self.manager getTechniquesOfType:kBOXING];
    XCTAssertEqual(boxingTech.count, 8);
}

-(void)testGetBoxingTechList {
    NSArray *list = [self.manager getBoxingTechniqueList];
    XCTAssertEqual([list objectAtIndex:0], kBOXING_TECH_ONE);
    XCTAssertEqual([list objectAtIndex:1], kBOXING_TECH_TWO);
    XCTAssertEqual([list objectAtIndex:2], kBOXING_TECH_THREE);
    XCTAssertEqual([list objectAtIndex:3], kBOXING_TECH_FOUR);
    XCTAssertEqual([list objectAtIndex:4], kBOXING_TECH_FIVE);
    XCTAssertEqual([list objectAtIndex:5], kBOXING_TECH_SIX);
    XCTAssertEqual([list objectAtIndex:6], kBOXING_TECH_SEVEN);
    XCTAssertEqual([list objectAtIndex:7], kBOXING_TECH_EIGHT);
}

-(void)testGetKickboxingTechList {
    NSArray *list = [self.manager getKickboxingTechniqueList];
    XCTAssertEqual([list objectAtIndex:0], kKICKBOXING_TECH_ONE);
    XCTAssertEqual([list objectAtIndex:1], kKICKBOXING_TECH_TWO);
    XCTAssertEqual([list objectAtIndex:2], kKICKBOXING_TECH_THREE);
    XCTAssertEqual([list objectAtIndex:3], kKICKBOXING_TECH_FOUR);
    XCTAssertEqual([list objectAtIndex:4], kKICKBOXING_TECH_FIVE);
    XCTAssertEqual([list objectAtIndex:5], kKICKBOXING_TECH_SIX);
    XCTAssertEqual([list objectAtIndex:6], kKICKBOXING_TECH_SEVEN);
    XCTAssertEqual([list objectAtIndex:7], kKICKBOXING_TECH_EIGHT);
}

@end
