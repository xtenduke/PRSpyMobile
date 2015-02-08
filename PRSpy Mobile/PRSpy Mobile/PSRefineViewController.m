//
//  PSRefineViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 8/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSRefineViewController.h"

@interface PSRefineViewController ()

@end

@implementation PSRefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shown = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (id)init {
    self = [super initWithNibName:@"PSRefineViewController" bundle:nil];
    
    if(self) {
        //do init stuff if needed
    }
    return self;
}




- (IBAction)applyPressed:(id)sender {
    [self applySettings];
}


- (IBAction)resetPressed:(id)sender {
    [self.emptyServerSwitch setOn:NO animated:YES];
}



- (void)applySettings {
    bool hideEmptyServers = [self.emptyServerSwitch isOn];
    [self.delegate applySettings: hideEmptyServers];
    
}


@end
