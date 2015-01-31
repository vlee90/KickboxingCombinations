//
//  TimerViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 1/29/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "TimerViewController.h"

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
