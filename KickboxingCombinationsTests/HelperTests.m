//
//  HelperTests.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/2/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Helper.h"

@interface HelperTests : XCTestCase

@property (strong, nonatomic) Helper* helper;

@end

@implementation HelperTests

- (void)setUp {
    [super setUp];
    self.helper = [[Helper alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

-(void)testConvertTimeIntoString {
    NSInteger testTime = 200;
    NSString* newString = [self.helper convertTimeIntegerIntoString:(NSInteger)testTime];
    XCTAssertTrue([newString isEqualToString:@"3:20"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
