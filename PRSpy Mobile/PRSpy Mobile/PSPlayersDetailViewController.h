//
//  PCPlayersDetailViewController.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSPlayersDetailViewController : UIViewController


@property (strong,nonatomic) IBOutlet UITableView *teamOneTable;
@property(strong,nonatomic) IBOutlet UITableView *teamTwoTable;

@property(strong,nonatomic) NSMutableArray *teamOneArray;
@property(strong,nonatomic) NSMutableArray *teamTwoArray;
@property (strong,nonatomic) NSString *teamOneName;
@property(strong,nonatomic) NSString *teamTwoName;

- (id)initWithData:(NSMutableArray*)teamOne teamTwo:(NSMutableArray*)teamTwo;
@end
