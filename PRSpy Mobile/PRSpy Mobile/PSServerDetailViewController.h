//
//  PCServerDetailViewController.h
//  PRSpy Mobile
//
//  Created by Jake Laurie on 7/02/15.
//  Copyright (c) 2015 Jake Laurie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSServerDetailViewController : UIViewController


@property (weak,nonatomic) IBOutlet UITextView *serverTextView;
@property (strong,nonatomic) NSString *serverText;

-(id)initWithData:(NSString*)serverText;

@end
