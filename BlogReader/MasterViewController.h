//
//  MasterViewController.h
//  BlogReader
//
//  Created by Eduardo Alvarado Díaz on 10/3/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

@property (strong,nonatomic) NSArray *titlesArray;

-(IBAction)goDetail;

@end

