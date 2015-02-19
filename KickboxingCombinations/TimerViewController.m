//
//  TimerViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TimerViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TAGDataLayer.h"
#import "TAGManager.h"

@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *restTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) TAGDataLayer *dataLayer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RAC(self.timerTextLabel, text) = RACObserve(self.timerViewModel, currentRoundTimeSTRING);
    RAC(self.roundsTextLabel, text) = RACObserve(self.timerViewModel, currentNumberOfRoundsSTRING);
    RAC(self.restTextLabel, text) = RACObserve(self.timerViewModel, currentRestTimeSTRING);
    RAC(self, title) = RACObserve(self.timerViewModel, currentWorkoutType);
//    RAC(self.startButton, backgroundColor) =
//        [RACObserve(self.timerViewModel, isPaused)
//         map:^id(NSNumber* paused) {
//             return [paused boolValue] ? [UIColor greenColor] : [UIColor redColor];
//         }];
//    RAC(self.view, backgroundColor) =
//        [RACObserve(self.timerViewModel, roundModeIsOn)
//         map:^id(NSNumber* roundModeIsOn) {
//             return [roundModeIsOn boolValue] ? [UIColor whiteColor] : [UIColor blueColor];
//         }];
    
    self.startButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.timerViewModel startButtonPressed];
        return [RACSignal empty];
    }];
    
    [RACObserve(self.timerViewModel, isPaused)
        subscribeNext:^(NSNumber* paused) {
            if ([paused boolValue]) {
                [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
            }
            else {
                [self.startButton setTitle:@"Pause" forState:UIControlStateNormal];
            }
        }];
    
    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLayer = [TAGManager instance].dataLayer;
    [self.dataLayer push:@{@"screenName" : @"Timer GTM",
                      @"event" : @"openScreen"}];
}

-(void)swipeRight:(UISwipeGestureRecognizer*)swipe {
    [self.dataLayer push:@{@"event" : @"swipeOccuried"}];
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:false];
    }];
    [self.navigationController popViewControllerAnimated:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
