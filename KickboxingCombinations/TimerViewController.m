//
//  TimerViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TimerViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundTitleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *restTitleTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *restTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RAC(self.timerTextLabel, text) = RACObserve(self.timerViewModel, currentRoundTimeSTRING);
    RAC(self.roundsTextLabel, text) = RACObserve(self.timerViewModel, currentNumberOfRoundsSTRING);
    RAC(self.restTextLabel, text) = RACObserve(self.timerViewModel, currentRestTimeSTRING);
    RAC(self, title) = RACObserve(self.timerViewModel, currentWorkoutType);
    RAC(self.startButton, backgroundColor) =
        [RACObserve(self.timerViewModel, timerOn)
         map:^id(NSNumber* timerIsOn) {
             return [timerIsOn boolValue] ? [UIColor redColor] : [UIColor greenColor];
         }];
    
    self.startButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.timerViewModel hitTimerCountdown];
        return [RACSignal empty];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
