//
//  myTableView.m
//  spamSail
//
//  Created by Lou Ciampanelli on 6/2/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import "foodTableView.h"
#import "LMCPlace.h"
#import "LMCFoodDetail.h"
#import "LMCFoodD.h"



@interface myTableView ()


@end

@implementation myTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];

    if (self) {
       

    }
    return self;
}

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x0FF2D55);
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"food";


    //[self setNeedsStatusBarAppearanceUpdate];
    
    // Create the places
    LMCPlace *boatBasin = [[LMCPlace alloc] init];
    [boatBasin setName: @"Boat Basin Café"];
    [boatBasin setDescription: @"79th St."];
    [boatBasin setAddress: @"West 79th St, New York, NY 10024"];
    [boatBasin setPhone: @"(212) 496-5542"];
    [boatBasin setRealPhone: @"2124965542"];
    [boatBasin setHours: @"12am - 11:30pm"];
    [boatBasin setLatitude: 40.785741];
    [boatBasin setLongitude: -73.984502];
    [boatBasin setLogo: [UIImage imageNamed:@"boatBasin.jpg"]];
    
    LMCPlace *battello = [[LMCPlace alloc] init];
    [battello setName: @"Battello"];
    [battello setDescription: @"Jersey City"];
    [battello setAddress: @"502 Washington Blvd, Jersey City, NJ 07310"];
    [battello setPhone: @"(201) 798-1798"];
    [battello setRealPhone: @"2017981798"];
    [battello setHours: @"5pm - 10pm"];
    [battello setLatitude: 40.725401];
    [battello setLongitude: -74.032490];
    [battello setLogo: [UIImage imageNamed:@"battelo.jpg"]];
    
    // Make the array
    NSArray *myPlaces = [NSMutableArray arrayWithObjects: boatBasin, battello, nil];
    
    // Sort the array alphabetically
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray * descriptors = [NSArray arrayWithObject:valueDescriptor];
    NSArray * sortedArray = [myPlaces sortedArrayUsingDescriptors:descriptors];
    
    // set the array
    [self setPlaces: sortedArray];

    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
//    return 0;
//}

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.places count];
}
// Height of the cells in the table view
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


// set up each cell for the table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: CellIdentifier];
        [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
        [cell.textLabel setFont: [UIFont fontWithName:@"STHeitiTC-Medium" size:26]];
        [cell.detailTextLabel setFont: [UIFont fontWithName:@"STHeitiTC-Medium" size:16]];
        
    }
    
    LMCPlace *item = [self.places objectAtIndex:indexPath.row];
    [cell.textLabel setText: [item name]];
    [cell.detailTextLabel setText: [item description]];
    
    
    // round the images and add borders
    CALayer * imgLayer = [cell.imageView layer];
    [imgLayer setMasksToBounds: YES];
    [imgLayer setCornerRadius: 2.0];
    [imgLayer setBorderWidth: 0.5];
    [imgLayer setBorderColor: [[UIColor blackColor] CGColor]];
    
    // display the images
    [cell.imageView setImage: [myTableView scale: [item logo]
                                           toSize: CGSizeMake(50,44)]];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = UIColorFromRGB(0x0FF2D55);
    [cell.textLabel setHighlightedTextColor: [UIColor whiteColor]];
    [cell.detailTextLabel setHighlightedTextColor: [UIColor whiteColor]];
    [bgColorView.layer setMasksToBounds: YES];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    LMCFoodD *detailedViewController = [[LMCFoodD alloc] init];
    
    LMCPlace *chosenPlace = [self.places objectAtIndex: indexPath.row];
    [detailedViewController setCurrentPlace: chosenPlace];
    
    [self.navigationController pushViewController:detailedViewController animated:YES];
    
}
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    [self performSegueWithIdentifier:@"Test" sender:self];

}
*/

@end
