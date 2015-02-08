//
//  PCPlayersDetailViewController.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSPlayersDetailViewController.h"

@interface PSPlayersDetailViewController ()

@end

@implementation PSPlayersDetailViewController


- (id)initWithData:(NSMutableArray*)teamOne teamTwo:(NSMutableArray*)teamTwo {
    self = [super initWithNibName:@"PSPlayersDetailViewController" bundle:nil];
    
    if(self) {
        self.teamOneArray = teamOne;
        self.teamTwoArray = teamTwo;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    
    if(tableView == self.teamOneTable) {
        count = [self.teamOneArray count];
    } else if(tableView == self.teamTwoTable) {
        count = [self.teamTwoArray count];
    }
    return count;
}


-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    if(tableView == self.teamOneTable) {
        return self.teamOneName;
    } else if(tableView == self.teamTwoTable) {
        return self.teamTwoName;
    }
    return @"Unknown";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    if(tableView == self.teamOneTable) {
        cell.textLabel.text = [[self.teamOneArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
    } else if(tableView == self.teamTwoTable) {
        cell.textLabel.text = [[self.teamTwoArray objectAtIndex:indexPath.row]objectForKey:@"Name"];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 25;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
