//
//  PSMap.m
//  PRSpy Mobile
//
//  Created by Jake Laurie on 8/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import "PSMap.h"

@implementation PSMap


- (id)initWithName:(NSString*)name {
    self = [super init];
    
    if(self) {
        self.friendlyName = name;
        //create url.....
    }
    return self;
}

@end
