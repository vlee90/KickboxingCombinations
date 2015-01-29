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
    [RACObserve(self.setupViewModel, currentWorkoutType)
        subscribeNext:^(id x) {
            NSLog(@"RACObserved change in currentWorkoutType");
            self.typeTextLabel.text = self.setupViewModel.currentWorkoutType;
        }];
    self.typeRightButon.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel typePositiveIncrement];
        return [RACSignal empty];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonPressed:(id)sender {
    NSLog(@"startButtonPressed");
}
- (IBAction)typeLeftButtonPressed:(id)sender {
}
- (IBAction)typeRightButtonPressed:(id)sender {
    
}
- (IBAction)roundsLeftButtonPressed:(id)sender {
}
- (IBAction)roundsRightButtonPressed:(id)sender {
}
- (IBAction)timeLeftButtonPressed:(id)sender {
}
- (IBAction)timeRightButtonPressed:(id)sender {
}
- (IBAction)restLeftButtonPressed:(id)sender {
}
- (IBAction)restRightButtonPressed:(id)sender {
}
- (IBAction)warningLeftButtonPressed:(id)sender {
}
- (IBAction)warningRightButtonPressed:(id)sender {
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
