//
//  PSService.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 31/01/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSService : NSObject


@property(nonatomic, weak)id delegate;

- (void)serviceMaintenanceRequest;
    
@end


@protocol PSServiceDelegate

- (void)serviceMaintenanceComplete:(NSMutableArray*)data;

@end
