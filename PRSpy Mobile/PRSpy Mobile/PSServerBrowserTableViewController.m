//
//  PPServerBrowserTableViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSBrowserCell.h"
#import "PSServerBrowserTableViewController.h"
#import "PSService.h"
#import "PSServer.h"
#import "AppDelegate.h"
#import "Config.h"

@interface PSServerBrowserTableViewController ()


@end

NSInteger selectedIndex;
AppDelegate *delegate;

@implementation PSServerBrowserTableViewController

- (void)viewDidLoad {
    
    delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    selectedIndex = -1;
    [super viewDidLoad];
    [self setupNavBar];
    self.service = [[PSService alloc]init];
    [self.service serviceMaintenanceRequest];
    [self.service setDelegate:self];
    
    self.refineView = [[PSRefineViewController alloc]init];
    [self.refineView setDelegate:self];
    [self.refineView.view setFrame:CGRectMake((delegate.window.frame.size.width), ( self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height), self.refineView.view.frame.size.width, self.refineView.view.frame.size.height)];
    
    [self.view addSubview:self.refineView.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"PSBrowserCell";
    PSBrowserCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil] lastObject];
    }
    
    //I MUST BE FIRST
    cell.currentServer = (PSServer*)[self.tableData objectAtIndex:indexPath.row];
    
    NSString *playersCount  = [NSString stringWithFormat:@" %@/%@",cell.currentServer.numPlayers,cell.currentServer.maxPlayers];

    cell.playerCount.text = playersCount;
    cell.expanded = NO;
    cell.serverName.text = cell.currentServer.serverName;
    cell.mapName.text = cell.currentServer.map.friendlyName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(selectedIndex == indexPath.row) {
        return TABLEVIEW_EXPANDED_HEIGHT;
    }
    else {
        return TABLEVIEW_NORMAL_HEIGHT;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(selectedIndex == indexPath.row) {
        //[(PSBrowserCell*)[tableView cellForRowAtIndexPath:indexPath]collapse];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.tableView reloadData];
    
        selectedIndex = -1;
    } else {
        selectedIndex = indexPath.row;
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}


- (void)goToSettings {
    //actually toggle settings
    
    if(self.refineView.shown) { //hide
        self.refineView.shown = NO;
        [UIView animateWithDuration:0.3f animations:^{

            [self.refineView.view setFrame:CGRectMake((delegate.window.frame.size.width), ( self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height), self.refineView.view.frame.size.width, self.refineView.view.frame.size.height)];
        }];
    } else {//show
        self.refineView.shown = YES;
        [UIView animateWithDuration:0.3f animations:^{
            
            [self.refineView.view setFrame:CGRectMake((delegate.window.frame.size.width -self.refineView.view.frame.size.width), ( self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height), self.refineView.view.frame.size.width, self.refineView.view.frame.size.height)];
        }];
    }
 }


#pragma mark RefineDelegateMethods
- (void)applySettings:(bool)showEmptyServers {
    self.hideEmptyServers = showEmptyServers;
    [self runRefinements];
}

#pragma mark Servicedelegate method

-(void)serviceMaintenanceComplete:(NSMutableArray*)data
{
    self.rawTableData = data;
    [self runRefinements];
}


- (void)runRefinements {
    self.tableData = self.rawTableData;
    
    if(self.hideEmptyServers) {
        
        NSMutableArray *newArray = [[NSMutableArray alloc]init];
        
        for(PSServer *server in self.tableData) {
            if (![server.numPlayers isEqualToString:@"0"]) {
                [newArray addObject:server];
            }
        }
        self.tableData = newArray;
        [self.tableView reloadData];
    } else {
        self.tableData = self.rawTableData;
        [self.tableView reloadData];
    }
    
    
}

@end
