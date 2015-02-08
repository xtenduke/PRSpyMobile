//
//  PSMap.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 8/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSMap : NSObject


@property (strong,nonatomic) NSString *friendlyName;
@property (strong,nonatomic) NSString *mapType;
@property (strong,nonatomic) NSString *mapImageUrl;

@property(strong,nonatomic) NSString *teamOneName;
@property(strong,nonatomic) NSString *teamTwoName;

- (id)initWithName:(NSString*)name;
@end
