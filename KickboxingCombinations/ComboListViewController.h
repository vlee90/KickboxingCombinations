//
//  ComboListViewController.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComboListViewModel.h"
#import "GAITrackedViewController.h"

@interface ComboListViewController : GAITrackedViewController

@property (strong, nonatomic) ComboListViewModel *comboListViewModel;

@end
