//
//  ComboListViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ComboListViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ComboListViewController ()

@property (weak, nonatomic) IBOutlet UILabel *techOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *techTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *techThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *techFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *techFiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *techSixLabel;
@property (weak, nonatomic) IBOutlet UILabel *techSevenLabel;
@property (weak, nonatomic) IBOutlet UILabel *techEightLabel;

@property (weak, nonatomic) IBOutlet UILabel *listLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftListButton;
@property (weak, nonatomic) IBOutlet UIButton *rightListButton;

@end

@implementation ComboListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.comboListViewModel setTechniqueLabels];
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

-(IBAction)leftListButtonPressed:(id)sender {
    
}

-(IBAction)rightListButtonPressed:(id)sender {
    
}

-(void)swipeDown:(UISwipeGestureRecognizer*)swipe {
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:false];
    }];
    [self.navigationController popViewControllerAnimated:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
