//
//  PSBaseViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSBaseViewController.h"

@interface PSBaseViewController ()

@end

@implementation PSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavBar {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.title = @"PRSpy Mobile";
    
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]init];
    [rightButton setTitle:@"Filter"];
    [rightButton setTarget:self];
    [rightButton setAction:@selector(goToSettings)];
    
    [self.navigationItem setRightBarButtonItem:rightButton];
}


- (void)goToSettings {
    //default nothing
}

@end
