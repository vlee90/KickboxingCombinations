//
//  SetupViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/28/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "SetupViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "TAGDataLayer.h"
#import "TAGManager.h"

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
@property NSInteger randX;
@property NSInteger randY;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setupViewModel = [[SetupViewModel alloc] initWithStateProperties];
    [self.navigationController setNavigationBarHidden:true];
    
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUp];

    //BackgroundAnimation
    [self.setupViewModel loadImagesIntoBackgroundArray];
    UIImageView* movingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    movingImageView.alpha = 0.3;
    movingImageView.layer.cornerRadius = 50;
    movingImageView.layer.masksToBounds = true;
    movingImageView.layer.borderWidth = 10.0;
    movingImageView.layer.borderColor = [[[UIColor alloc] initWithRed:0.675 green:0.714 blue:0.737 alpha:1.0] CGColor];
    
    movingImageView.animationImages = self.setupViewModel.backgroundArray;
    movingImageView.animationDuration = 10;
    [movingImageView startAnimating];
    [self.view addSubview:movingImageView];
//    6: 375 667
//    4: 320 480
    [self moveImage:movingImageView];

    
    RAC(self.typeTextLabel, text) = RACObserve(self.setupViewModel, currentWorkoutType);
    //WorkoutType
    self.typeRightButon.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel typePositiveIncrement];
        return [RACSignal empty];
        }];
    self.typeLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel typeNegativeIncrement];
        return [RACSignal empty];
        }];
    
    //Number of Rounds
    RAC(self.numberOfRoundsTextLabel, text) = RACObserve(self.setupViewModel, currentNumberOfRoundsSTRING);
    self.roundsRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel numberOfRoundsPositiveIncrement];
        return [RACSignal empty];
        }];
    self.roundsLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel numberOfRoundsNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //RoundTime
    RAC(self.roundDurationTextLabel, text) = RACObserve(self.setupViewModel, currentRoundTimeSTRING);
    self.timeRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundTimePositiveIncrement];
        return [RACSignal empty];
    }];
    self.timeLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundTimeNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //RestTime
    RAC(self.restTextLabel, text) = RACObserve(self.setupViewModel, currentRestTimeSTRING);
    self.restRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundRestPositiveIncrement];
        return [RACSignal empty];
    }];
    self.restLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel roundRestNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //WarningTime
    RAC(self.warningTextLabel, text) = RACObserve(self.setupViewModel, currentWarningTimeSTRING);
    self.warningRightButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel warningTimePositiveIncrement];
        return [RACSignal empty];
    }];
    self.warningLeftButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self.setupViewModel warningTimeNegativeIncrement];
        return [RACSignal empty];
    }];
    
    //Start Button
//    self.startButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//        [self.setupViewModel createWorkout];
//        [UIView animateWithDuration:1.0 animations:^{
//            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
//            [self.navigationController pushViewController:[self.setupViewModel createTimerViewControllerFromStoryboardWithTimerViewModel] animated:false];
//            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:false];
//        }];
//
//        return [RACSignal empty];
//    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"screenName" : @"Setup Screen GTM",
                      @"event" : @"openScreen" }
                      ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveImage:(UIView*)imageView {
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        imageView.center = CGPointMake(self.randX, self.randY);
    } completion:^(BOOL finished) {
        imageView.center = CGPointMake(self.randX, self.randY);
        [self calculateNewRandomPosition];
        [self moveImage:imageView];
    }];
}

-(void)calculateNewRandomPosition {
    self.randX = arc4random_uniform(375);
    self.randY = arc4random_uniform(667);
}

-(void)swipeLeft:(UISwipeGestureRecognizer*)swipe {
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"swipeOccuried"}];
    [self.setupViewModel createWorkout];
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [self.navigationController pushViewController:[self.setupViewModel createTimerViewControllerFromStoryboardWithTimerViewModel] animated:false];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:false];
    }];
}

-(void)swipeUp:(UISwipeGestureRecognizer*)swipe {
    TAGDataLayer *dataLayer = [TAGManager instance].dataLayer;
    [dataLayer push:@{@"event" : @"swipeOccuried"}];
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [self.navigationController pushViewController:[self.setupViewModel createComboListViewControllerFromStoryboardWithComboViewModel] animated:false];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:false];
    }];
}

@end
