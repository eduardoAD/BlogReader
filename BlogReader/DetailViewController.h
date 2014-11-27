//
//  DetailViewController.h
//  BlogReader
//
//  Created by Eduardo Alvarado Díaz on 10/3/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

-(IBAction)goMaster;

@end

