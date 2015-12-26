//
//  LMCFoodD.h
//  spamSail
//
//  Created by Lou Ciampanelli on 6/17/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LMCPlace.h"

@interface LMCFoodD : UIViewController <MKMapViewDelegate>


@property (strong, nonatomic) LMCPlace *currentPlace;


@property (weak, nonatomic) IBOutlet UILabel *hours;


@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *address;


@property (weak, nonatomic) IBOutlet UIButton *phone;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;


@end
