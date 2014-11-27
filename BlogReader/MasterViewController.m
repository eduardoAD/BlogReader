//
//  MasterViewController.m
//  BlogReader
//
//  Created by Eduardo Alvarado Díaz on 10/3/14.
//  Copyright (c) 2014 Globant. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@implementation MasterViewController

-(IBAction)goDetail{

}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];

    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];

    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];


    self.blogPosts = [dataDictionary objectForKey:@"posts"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *blogPost = self.blogPosts[indexPath.row];
        NSString *title = [blogPost valueForKey:@"title"];
        [[segue destinationViewController] setDetailItem:title];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *blogPost = self.blogPosts[indexPath.row];
    cell.textLabel.text = [blogPost valueForKey:@"title"];
    cell.detailTextLabel.text = [blogPost valueForKey:@"author"];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[self performSegueWithIdentifier:@"showDetail" sender:self];
    NSDictionary *blogPost = self.blogPosts[indexPath.row];
    NSString *title = [blogPost valueForKey:@"title"];

    UIStoryboard *goDetail = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
    UIViewController *initialViewController = [goDetail instantiateInitialViewController];
    initialViewController.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
    [(DetailViewController*)initialViewController setDetailItem:title];

    [self presentViewController:initialViewController animated:YES completion:^{

    }];
}


@end
