//
//  PPServerBrowserTableViewController.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSService.h"

@interface PSServerBrowserTableViewController : UITableViewController

@property(strong, nonatomic) NSMutableArray *tableData;
@property (strong,nonatomic) PSService *service;


@end
