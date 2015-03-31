//
//  VIewUserStatusTableViewController.m
//  MoiTest
//
//  Created by Jaime Moises Gutierrez on 3/31/15.
//  Copyright (c) 2015 JMGL. All rights reserved.
//

#import "VIewUserStatusTableViewController.h"
#import "Friend.h"
#import "MBProgressHUD.h"

@interface VIewUserStatusTableViewController ()

@property (nonatomic, strong) NSArray *friendListArray;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation VIewUserStatusTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self loadFriends];
    [self setupHUD];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.friendListArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatusCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - URL requests

- (void)loadFriends
{
    NSURL *url = [NSURL URLWithString:@"http://private-5bdb3-friendmock.apiary-mock.com/friends"];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil)
         {
             NSError *error = nil;
             NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
             
             if (error != nil)
             {
                 NSLog(@"Error parsing JSON.");
                 [self performSelectorOnMainThread:@selector(failedLoadingCategories) withObject:nil waitUntilDone:YES];
             }
             else
             {
                 NSLog(@"Array: %@", jsonArray);
                 NSMutableArray *arr;
                 for (int i = 0; i < jsonArray.count; i++) {
                     Friend *temp = [[[Friend alloc] init] initFriendWithData:[jsonArray objectAtIndex:i]];
                     [arr addObject:temp];
                 }
                 self.friendListArray = [[NSArray alloc] initWithArray:arr];
                 
                 [self performSelectorOnMainThread:@selector(finishedLoadingFriendList) withObject:nil waitUntilDone:YES];
             }
         }
         else if ([data length] == 0 && error == nil)
         {
             NSLog(@"no data downloaded");
             [self performSelectorOnMainThread:@selector(finishedLoadingFriendList) withObject:nil waitUntilDone:YES];
         }
         else if (error != nil && error.code == NSURLErrorTimedOut)
         {
             NSLog(@"URL request timed out");
             [self performSelectorOnMainThread:@selector(finishedLoadingFriendList) withObject:nil waitUntilDone:YES];
         }
         else if (error != nil)
         {
             [self performSelectorOnMainThread:@selector(finishedLoadingFriendList) withObject:nil waitUntilDone:YES];
             NSLog(@"error: %@", error);
         }
     }];
}

- (void)finishedLoadingFriendList
{
    [self.tableView reloadData];
    [self.hud hide:YES];
}

- (void)failedLoadingCategories
{
    self.hud.labelText = @"Retrying...";
    [self loadFriends];
}

#pragma mark - MBprogressHUD

- (void)setupHUD
{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.labelText = @"Loading";
    [self.view addSubview:self.hud];
    [self.hud show:YES];
}

@end
