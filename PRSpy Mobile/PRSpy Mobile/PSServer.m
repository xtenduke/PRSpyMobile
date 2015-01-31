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
     
        self.mapName = [dataDict objectForKey:@"MapName"];
        self.ipAddress = [dataDict objectForKey:@"IPAddress"];
        self.country = [dataDict objectForKey:@"Country"];
        self.serverName = [dataDict objectForKey:@"ServerName"];
        
        self.rawPlayers = [dataDict objectForKey:@"Players"];
        
        [self splitPlayers:self.rawPlayers];
        
    }
    
    return self;
}

-(void) splitPlayers:(NSArray*)players
{
    for(id p in players){
        if([p objectForKey:@"Team"] == [NSNumber numberWithInt:1]){
            [self.teamOne addObject:p]; }
        else if([p objectForKey:@"Team"] == [NSNumber numberWithInt:2]){ [self.teamTwo addObject:p]; }
        else{
            NSLog(@"Team other than 1 or 2 found. Team: %@", [p objectForKey:@"Team"]);
        }
    }
}

@end
