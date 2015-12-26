//
//  LMCPlace.h
//  spamSail
//
//  Created by Lou Ciampanelli on 6/3/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMCPlace : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) NSString *hours;
@property (nonatomic, assign) NSString *phone;
@property (nonatomic, assign) NSString *realPhone;


@property (nonatomic, strong) UIImage *logo;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;


@end
