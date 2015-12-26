//
//  LMCFoodD.m
//  spamSail
//
//  Created by Lou Ciampanelli on 6/17/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import "LMCFoodD.h"

@interface LMCFoodD ()

@end

@implementation LMCFoodD

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)call:(UIButton *)sender
{
    NSString *phoneNumber = [@"tel:" stringByAppendingString: self.currentPlace.realPhone];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
    [self.name setText:phoneNumber];

}

- (void)populateViewWithPlace:(LMCPlace *)place
{
    //set the place
    [super viewDidLoad];
    [self setCurrentPlace: place];
    
    CALayer * mapLayer = [self.mapView layer];
    [mapLayer setMasksToBounds: YES];
    [mapLayer setCornerRadius: 0.0];
    [mapLayer setBorderWidth: 0.5];
    [mapLayer setBorderColor: [[UIColor blackColor] CGColor]];
    
    
    //self.navigationItem.title = self.currentPlace.name;
    [self.name setText : self.currentPlace.name];
    [self.name setAdjustsFontSizeToFitWidth: YES];
    [self.address setText : self.currentPlace.address];
    [self.address setAdjustsFontSizeToFitWidth : YES];
    NSString *hours = @"Hours: ";
    hours = [hours stringByAppendingString: self.currentPlace.hours];
    [self.hours setText : hours ];
    [self.hours setAdjustsFontSizeToFitWidth: YES];
    
    [self setLongitude: self.currentPlace.longitude];
    [self setLatitude: self.currentPlace.latitude];
    
    [self.phone setTitle:self.currentPlace.phone forState:UIControlStateNormal];
    [self.phone.titleLabel setAdjustsFontSizeToFitWidth: YES];
    
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001921, 0.0012500);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    [self.mapView setRegion: region
                   animated: NO];
    
    // set map type
    [self.mapView setMapType: MKMapTypeSatellite];
    
    // optional controls for mapView
    [self.mapView setZoomEnabled: YES];
    [self.mapView setScrollEnabled: YES];
    
    
    
    
  
}
- (void)viewWillAppear:(BOOL)animated
{
    [self populateViewWithPlace:[self currentPlace]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
