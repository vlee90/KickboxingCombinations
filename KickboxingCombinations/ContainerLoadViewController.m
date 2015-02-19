//
//  ContainerLoadViewController.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/18/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ContainerLoadViewController.h"
#import "TAGManager.h"
#import "TAGContainerOpener.h"
#import "TAGContainer.h"
#import "AppDelegate.h"
#import "SetupViewController.h"

@interface ContainerLoadViewController ()<TAGContainerOpenerNotifier>

@property (weak, nonatomic) TAGManager *tagManager;
@property (weak, nonatomic) TAGContainer *container;

@end

@implementation ContainerLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.tagManager = appDelegate.tagManager;
    self.container = appDelegate.container;
    
    [TAGContainerOpener openContainerWithId:@"GTM-M9CBHM"
                                 tagManager:self.tagManager
                                   openType:kTAGOpenTypePreferNonDefault
                                    timeout:nil
                                   notifier:self];
    NSTimeInterval dispatchTime = 10;
    self.tagManager.dispatchInterval = dispatchTime;

}

-(void)containerAvailable:(TAGContainer *)container {
    NSLog(@"containerAvailable Fired");
    dispatch_async(dispatch_get_main_queue(), ^{
        self.container = container;
        [self.container refresh];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        SetupViewController *setupViewController = [storyboard instantiateViewControllerWithIdentifier:@"SetupViewController"];
        [self.navigationController pushViewController:setupViewController animated:false];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
