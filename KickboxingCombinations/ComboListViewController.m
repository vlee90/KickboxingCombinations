//
//  ComboListViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ComboListViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TAGDataLayer.h"
#import "TAGManager.h"

@interface ComboListViewController ()

@property (weak, nonatomic) IBOutlet UILabel *techOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *techTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *techThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *techFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *techFiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *techSixLabel;
@property (weak, nonatomic) IBOutlet UILabel *techSevenLabel;
@property (weak, nonatomic) IBOutlet UILabel *techEightLabel;

@end

@implementation ComboListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.comboListViewModel setTechTwo:@"2 - Cross"];
    [self.comboListViewModel getTAGContainerFromAppDelegate];
    [self.comboListViewModel setTechniquesFromContainer];
    
    RAC(self.techOneLabel, text) = RACObserve(self.comboListViewModel, techOne);
    RAC(self.techTwoLabel, text) = RACObserve(self.comboListViewModel, techTwo);
    RAC(self.techThreeLabel, text) = RACObserve(self.comboListViewModel, techThree);
    RAC(self.techFourLabel, text) = RACObserve(self.comboListViewModel, techFour);
    RAC(self.techFiveLabel, text) = RACObserve(self.comboListViewModel, techFive);
    RAC(self.techSixLabel, text) = RACObserve(self.comboListViewModel, techSix);
    RAC(self.techSevenLabel, text) = RACObserve(self.comboListViewModel, techSeven);
    RAC(self.techEightLabel, text) = RACObserve(self.comboListViewModel, techEight);
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"screenName" : @"ComboList GTM",
                      @"event" : @"openScreen"}
                        ];
}

-(void)swipeDown:(UISwipeGestureRecognizer*)swipe {
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"swipeOccuried"}];
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:false];
    }];
    [self.navigationController popToRootViewControllerAnimated:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
