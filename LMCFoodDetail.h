//
//  LMCFoodDetail.h
//  spamSail
//
//  Created by Lou Ciampanelli on 6/15/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMCPlace.h"

@interface LMCFoodDetail : UIViewController

@property (strong, nonatomic) LMCPlace *currentPlace;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
