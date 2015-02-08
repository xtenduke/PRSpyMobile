//
//  PSBrowserCellViewTableViewCell.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSServer.h"
#import "PSPlayersDetailViewController.h"
#import "PSMapDetailViewController.h"
#import "PSServerDetailViewController.h"

@interface PSBrowserCell : UITableViewCell 

@property (weak,nonatomic) IBOutlet UILabel *serverName;
@property (weak,nonatomic) IBOutlet UILabel *mapName;
@property (weak,nonatomic) IBOutlet UILabel *playerCount;
@property (weak,nonatomic) IBOutlet UIImageView *countryImage;
@property (weak,nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property BOOL expanded;


@property (strong,nonatomic) IBOutlet UIView *baseDetailView;
@property (strong,nonatomic) PSPlayersDetailViewController *playersView;
@property (strong,nonatomic) PSMapDetailViewController *mapView;
@property (strong,nonatomic) PSServerDetailViewController *serverView;


@property(strong,nonatomic) PSServer *currentServer;

- (void)collapse;
@end
