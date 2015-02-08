//
//  PCServerDetailViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSServerDetailViewController.h"

@interface PSServerDetailViewController ()

@end

@implementation PSServerDetailViewController

-(id)initWithData:(NSString*)serverText {
    self = [super initWithNibName:@"PSServerDetailViewController" bundle:nil];
    
    if(self) {
        self.serverText = serverText;
    }
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.serverTextView.text = self.serverText;
    // Do any additional setup after loading the view from its nib.
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
