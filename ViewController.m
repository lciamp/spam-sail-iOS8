//
//  ViewController.m
//  spamSail
//
//  Created by Lou Ciampanelli on 6/1/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.foodButton.layer.borderWidth = 0;
    self.foodButton.layer.cornerRadius = 2;
    
    self.gasButton.layer.borderWidth = 0;
    self.gasButton.layer.cornerRadius = 2;
    
    self.dockButton.layer.borderWidth = 0;
    self.dockButton.layer.cornerRadius = 2;
    
    self.sitesButton.layer.borderWidth = 0;
    self.sitesButton.layer.cornerRadius = 2;
    
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)foodButtonPressed:(UIButton *)sender {
    //self.titleLabel.text = @"food button pressed";
}


- (IBAction)gasButtonPressed:(UIButton *)sender {
    //self.titleLabel.text = @"gas button pressed";
    
    /* GET ALL FONT NAMES
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"Family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"~~~~~~~~");
    }
     */
}

- (IBAction)dockButtonPressed:(UIButton *)sender {
    //self.titleLabel.text = @"dock button pressed";
}

- (IBAction)sitesButtonPressed:(id)sender {
    //self.titleLabel.text = @"sites button pressed";
}





@end
