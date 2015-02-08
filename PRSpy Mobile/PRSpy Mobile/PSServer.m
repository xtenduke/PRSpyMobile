//
//  PSServer.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSServer.h"

@implementation PSServer

-(id) initWithDict:(NSDictionary*)dataDict
{
    self = [super init];
    
    if(self){
     
        self.map = [[PSMap alloc]initWithName:[dataDict objectForKey:@"MapName"]];
        self.map.teamOneName = [dataDict objectForKey:@"Team1Name"];
        self.map.teamTwoName = [dataDict objectForKey:@"Team2Name"];
    
        self.ipAddress = [dataDict objectForKey:@"IPAddress"];
        self.country = [dataDict objectForKey:@"Country"];
        self.serverName = [dataDict objectForKey:@"ServerName"];
        self.rawPlayers = [dataDict objectForKey:@"Players"];
        self.numPlayers = [[dataDict objectForKey:@"NumPlayers"]stringValue];
        self.maxPlayers = [[dataDict objectForKey:@"MaxPlayers"]stringValue];
        self.serverText = [dataDict objectForKey:@"ServerText"];
        
        self.teamOne = [[NSMutableArray alloc]init];
        self.teamTwo = [[NSMutableArray alloc]init];
        [self splitPlayers:self.rawPlayers];

        
        [self trimName];
        
    }
    
    return self;
}

-(void) splitPlayers:(NSArray*)players
{
    for(id p in players){
        if([[p objectForKey:@"Team"] isEqualToNumber: [NSNumber numberWithInt:1]]){
            [self.teamOne addObject:p]; }
        else if([[p objectForKey:@"Team"] isEqualToNumber: [NSNumber numberWithInt:2]]){ [self.teamTwo addObject:p]; }
        else{
            NSLog(@"Team other than 1 or 2 found. Team: %@", [p objectForKey:@"Team"]);
        }
    }
}

- (void)trimName {
    self.serverName = [self.serverName substringFromIndex:13];
}


@end
