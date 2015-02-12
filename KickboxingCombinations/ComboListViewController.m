//
//  ComboListViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ComboListViewController.h"

@interface ComboListViewController ()

@end

@implementation ComboListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
}

-(void)swipeDown:(UISwipeGestureRecognizer*)swipe {
    [self.navigationController popViewControllerAnimated:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
