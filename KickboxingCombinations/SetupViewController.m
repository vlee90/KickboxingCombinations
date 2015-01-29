//
//  SetupViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SetupViewController ()

//Immutable Labels
@property (weak, nonatomic) IBOutlet UILabel *typeTitleTextlabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRoundsTitleTextlabel;
@property (weak, nonatomic) IBOutlet UILabel *roundDurationTitleTextlabel;
@property (weak, nonatomic) IBOutlet UILabel *restTitleTextlabel;
@property (weak, nonatomic) IBOutlet UILabel *warningTitleTextlabel;

//Mutable Labels
@property (weak, nonatomic) IBOutlet UILabel *typeTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRoundsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundDurationTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *restTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *warningTextLabel;

//Button
@property (weak, nonatomic) IBOutlet UIBarButtonItem *startButton;
@property (weak, nonatomic) IBOutlet UIButton *typeLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *typeRightButon;
@property (weak, nonatomic) IBOutlet UIButton *roundsLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *roundsRightButton;
@property (weak, nonatomic) IBOutlet UIButton *timeLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *timeRightButton;
@property (weak, nonatomic) IBOutlet UIButton *restLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *restRightButton;
@property (weak, nonatomic) IBOutlet UIButton *warningLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *warningRightButton;

//State
@property (strong, nonatomic) SetupViewModel* setupViewModel;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setupViewModel = [[SetupViewModel alloc] initWithPoolProperties];
    //WorkoutType
    [RACObserve(self.setupViewModel, currentWorkoutType)
        subscribeNext:^(id x) {
            self.typeTextLabel.text = self.setupViewModel.currentWorkoutType;
        }];
    @weakify(self)
    self.typeRightButon.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        [self.setupViewModel typePositiveIncrement];
        return [RACSignal empty];
        }];
    self.typeLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        [self.setupViewModel typeNegativeIncrement];
        return [RACSignal empty];
        }];
    
    //Number of Rounds
    [RACObserve(self.setupViewModel, currentNumberOfRounds)
         subscribeNext:^(id x) {
             self.numberOfRoundsTextLabel.text = [NSString stringWithFormat:@"%ld",self.setupViewModel.currentNumberOfRounds];
         }];
    self.roundsRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel numberOfRoundsPositiveIncrement];
        return [RACSignal empty];
        }];
    self.roundsLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel numberOfRoundsNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //RoundTime
    [RACObserve(self.setupViewModel, currentRoundTimeINT)
        subscribeNext:^(id x) {
            self.roundDurationTextLabel.text = [NSString stringWithFormat:@"%ld", self.setupViewModel.currentRoundTimeINT];
        }];
    self.timeRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundTimePositiveIncrement];
        return [RACSignal empty];
    }];
    self.timeLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundTimeNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //RestTime
    [RACObserve(self.setupViewModel, currentRestTimeINT)
        subscribeNext:^(id x) {
            self.restTextLabel.text = [NSString stringWithFormat:@"%ld", self.setupViewModel.currentRestTimeINT];
        }];
    self.restRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundRestPositiveIncrement];
        return [RACSignal empty];
    }];
    self.restLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundRestNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //WarningTime
    [RACObserve(self.setupViewModel, currentWarningTimeINT)
        subscribeNext:^(id x) {
            self.warningTextLabel.text = [NSString stringWithFormat:@"%ld", self.setupViewModel.currentWarningTimeINT];
        }];
    self.warningRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel warningTimePositiveIncrement];
        return [RACSignal empty];
    }];
    self.warningLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel warningTimeNegativeIncrement];
        return [RACSignal empty];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
