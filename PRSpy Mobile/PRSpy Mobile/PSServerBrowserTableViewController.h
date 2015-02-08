//
//  PPServerBrowserTableViewController.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSService.h"
#import "PSBaseViewController.h"
#import "PSRefineViewController.h"

@interface PSServerBrowserTableViewController : PSBaseViewController

@property(strong, nonatomic) NSMutableArray *tableData;
@property(strong, nonatomic) NSMutableArray *rawTableData;

@property (strong,nonatomic) PSService *service;
@property (strong,nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) PSRefineViewController *refineView;

@property bool hideEmptyServers;

@end
