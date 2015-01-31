//
//  PSService.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "Config.h"
#import "PSServer.h"
#import "PSService.h"
#import "AppDelegate.h"
#import "AFHTTPRequestOperation.h"

@implementation PSService



- (id)init {
    self = [super init];
    
    if(self) {
      //do init stuff
    }
    return self;
}





- (void)serviceMaintenanceRequest {
    NSURL *reqUrl = [NSURL URLWithString:MAINTENANCE_SERVER_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:reqUrl];
    
    [NSNumber numberWithInt:1];
    AFHTTPRequestOperation *afRequest = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    afRequest.responseSerializer = [AFJSONResponseSerializer serializer];
    [afRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *afRequest, id responseObject) {
        
        //send back all the 'shopItems'
        NSArray *serversRawArray = [responseObject objectForKey:@"Data"];
        NSLog(@"DL COMPLETE");
        
        NSMutableArray *serversObjArray = [[NSMutableArray alloc]init];

        for(id server in serversRawArray) {
            PSServer *currentServer = [[PSServer alloc]initWithDict:server];
            [serversObjArray addObject:currentServer];
            
            
            
            NSLog(@" %@",currentServer.serverName);
        }
        
        
        
        
    } failure:^(AFHTTPRequestOperation *op, NSError *error) {
        NSLog(@"MAIN MAINTENANCE REQUEST ERROR %@",error);

    }];
    
    [afRequest start];
}



@end
