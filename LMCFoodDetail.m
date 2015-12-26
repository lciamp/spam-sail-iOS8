//
//  LMCFoodDetail.m
//  spamSail
//
//  Created by Lou Ciampanelli on 6/15/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import "LMCFoodDetail.h"

@interface LMCFoodDetail ()

@end

@implementation LMCFoodDetail

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
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationItem.title = @"Food";
    self.name.text = self.currentPlace.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)populateViewWithPlace:(LMCPlace *)place
{
    //set the place
    [super viewDidLoad];
    [self setCurrentPlace: place];
    
    
    self.navigationItem.title = self.currentPlace.name;
    self.name.text = self.currentPlace.name;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [self populateViewWithPlace:[self currentPlace]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
