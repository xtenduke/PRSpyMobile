//
//  PSHomeViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSHomeViewController.h"
#import "PSServerBrowserTableViewController.h"

@interface PSHomeViewController ()

@end

@implementation PSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden =YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)browserButtonPressed:(id)sender {
    PSServerBrowserTableViewController *browser = [[PSServerBrowserTableViewController alloc]initWithNibName:@"PSServerBrowserTableViewController" bundle:nil];
    [self.navigationController pushViewController:browser animated:YES];
}

@end
