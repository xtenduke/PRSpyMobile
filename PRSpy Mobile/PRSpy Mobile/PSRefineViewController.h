//
//  PSRefineViewController.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 8/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSRefineViewController : UIViewController


@property BOOL shown;

-(id)init;

@property (weak,nonatomic) id delegate;

@property (weak,nonatomic) IBOutlet UISwitch *emptyServerSwitch;
@property (weak, nonatomic) UIButton *applyButton;
@property (weak, nonatomic) UIButton *resetButton;



@end


@protocol PSRefineViewControllerDelegate

- (void)applySettings:(bool)showEmptyServers;

@end