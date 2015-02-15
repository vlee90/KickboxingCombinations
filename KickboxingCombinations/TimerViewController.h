//
//  TimerViewController.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerViewModel.h"
#import "GAITrackedViewController.h"

@interface TimerViewController : GAITrackedViewController

@property (strong, nonatomic) TimerViewModel* timerViewModel;

@end
