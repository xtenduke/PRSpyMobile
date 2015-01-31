//
//  PSService.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "Config.h"
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
    
    AFHTTPRequestOperation *afRequest = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    afRequest.responseSerializer = [AFJSONResponseSerializer serializer];
    [afRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *afRequest, id responseObject) {
        
        //send back all the 'shopItems'
        NSArray *serversArray = [responseObject objectForKey:@"Data"];
        NSLog(@"DL COMPLETE");
        for(id servers in serversArray) {
            NSLog(@"MAP %@",[servers objectForKey:@"MapName"]);
            
        }
        
    } failure:^(AFHTTPRequestOperation *op, NSError *error) {
        NSLog(@"MAIN MAINTENANCE REQUEST ERROR %@",error);

    }];
    
    [afRequest start];
}



@end
