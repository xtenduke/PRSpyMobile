//
//  PSServer.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSServer : NSObject

-(id)initWithDict:(NSDictionary*)dataDict;

@property(strong, nonatomic) NSString *mapName;
@property(strong, nonatomic) NSString *ipAddress;
@property(strong, nonatomic) NSString *country;
@property(strong, nonatomic) NSString *serverName;

@property(strong, nonatomic) NSArray *rawPlayers;
@property(strong, nonatomic) NSMutableArray *teamOne;
@property(strong, nonatomic) NSMutableArray *teamTwo;

@end
