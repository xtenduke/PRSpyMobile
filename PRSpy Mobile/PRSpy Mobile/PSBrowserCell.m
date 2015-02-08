//
//  PSBrowserCellViewTableViewCell.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSBrowserCell.h"
#import "AppDelegate.h"


@implementation PSBrowserCell

- (void)awakeFromNib {
    // Initialization code

    [self.baseDetailView setFrame:CGRectMake(0, self.baseDetailView.frame.origin.y, self.frame.size.width *3, self.baseDetailView.frame.size.height)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(self.isSelected) {
        if(!self.playersView) {
        [self addDetailViews];
        }
        
    }
    UIView * selectedBackgroundView = [[UIView alloc] init];
    [selectedBackgroundView setBackgroundColor:[UIColor lightGrayColor]]; // set color here
    [self setSelectedBackgroundView:selectedBackgroundView];
}

- (void)addDetailViews {
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
        
    self.playersView = [[PSPlayersDetailViewController alloc]initWithData:self.currentServer.teamOne teamTwo:self.currentServer.teamTwo];
    self.playersView.teamOneName = self.currentServer.map.teamOneName;
    self.playersView.teamTwoName = self.currentServer.map.teamTwoName;
    
    [self.playersView.view setFrame:CGRectMake(0,
                                               0,
                                               delegate.window.frame.size.width,
                                               self.playersView.view.frame.size.height)];
    [self.baseDetailView addSubview:self.playersView.view];
    
    
    self.mapView = [[PSMapDetailViewController alloc]initWithNibName:@"PSMapDetailViewController" bundle: nil];
    [self.mapView.view setFrame:CGRectMake(self.playersView.view.frame.origin.x + self.playersView.view.frame.size.width,
                                           0,
                                           delegate.window.frame.size.width,
                                           self.mapView.view.frame.size.height)];
    [self.baseDetailView addSubview:self.mapView.view];
    
    
    self.serverView = [[PSServerDetailViewController alloc]initWithData:self.currentServer.serverText];
    [self.serverView.view setFrame:CGRectMake(self.mapView.view.frame.origin.x + self.mapView.view.frame.size.width,
                                                  0,
                                                  delegate.window.frame.size.width,
                                                  self.serverView.view.frame.size.height)];
    
    [self.baseDetailView addSubview:self.serverView.view];
}


- (IBAction)segmentChange:(UISegmentedControl*)sender {
    CGRect frame;
    
    if(sender.selectedSegmentIndex == 0) {
        frame = CGRectMake(0, self.baseDetailView.frame.origin.y, self.baseDetailView.frame.size.width, self.baseDetailView.frame.size.height);
    } else {
        frame = CGRectMake((-self.frame.size.width) * sender.selectedSegmentIndex, self.baseDetailView.frame.origin.y, self.baseDetailView.frame.size.width, self.baseDetailView.frame.size.height);
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        [self.baseDetailView setFrame:frame];
    }];
    
}

- (void)collapse {
    //destroy everything
    self.playersView =nil;
    self.mapView = nil;
    self.serverView = nil;
}




@end
