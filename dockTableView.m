//
//  dockTableView.m
//  spamSail
//
//  Created by Lou Ciampanelli on 6/2/14.
//  Copyright (c) 2014 Lou Ciampanelli. All rights reserved.
//

#import "dockTableView.h"
#import "LMCPlace.h"
#import "LMCFoodDetail.h"

@interface dockTableView ()
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;


@end

@implementation dockTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x05856D6);
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"docks";
    
    
    
    LMCPlace *linconHarbor = [[LMCPlace alloc] init];
    [linconHarbor setName: @"Lincon Harbor"];
    [linconHarbor setDescription: @"Home of Sails Exclusive"];
    [linconHarbor setAddress: @"5"];
    [linconHarbor setPhone: @"tel://19175363963"];
    
    [linconHarbor setLatitude: 40.759698];
    [linconHarbor setLongitude: -74.020861];
    
    [linconHarbor setLogo: [UIImage imageNamed:@"spamHead.tiff"]];
    
    
    
    
    NSArray *myPlaces = [NSMutableArray arrayWithObjects: linconHarbor, nil];
    
    [self setPlaces: myPlaces];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
// Return the number of sections.
//    return 0;
//}

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
        cell.textLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:24];
        cell.detailTextLabel.font = [UIFont fontWithName:@"STHeitiTC-Medium" size:14];
        
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
    [cell.imageView setImage: [dockTableView scale: [item logo]
                                          toSize: CGSizeMake(50,44)]];
    
    UIView *bgColorView = [[UIView alloc] init];
    [bgColorView setBackgroundColor: UIColorFromRGB(0x05856D6)];
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
    
    LMCFoodDetail *detailedViewController = [[LMCFoodDetail alloc] init];
    
    [self.navigationController pushViewController:detailedViewController animated:YES];
   
    
}

/*
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
