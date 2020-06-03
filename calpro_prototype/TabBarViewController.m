//
//  TabBarViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "TabBarViewController.h"
#import "ProfileTabViewController.h"
#import "StoreTabViewController.h"
#import "DiscoverTabViewController.h"
#import "DashboardTabViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", _userid);
    
    [self passUseridToAllTabs];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


- (void)passUseridToAllTabs {
    
    //get storyboard
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //pass to dashboard tab
    DashboardTabViewController* Davc = [sb instantiateViewControllerWithIdentifier:@"DashboardTabViewController"];
    Davc.userid = self.userid;
    
    //pass to profile tab
    ProfileTabViewController* Pvc = [sb instantiateViewControllerWithIdentifier:@"ProfileTabViewController"];
    Pvc.userid = self.userid;
    
    //pass to store tab
    StoreTabViewController* Svc = [sb instantiateViewControllerWithIdentifier:@"StoreTabViewController"];
    Svc.userid = self.userid;
    
    //pass to discover tab
    DiscoverTabViewController* Dvc = [sb instantiateViewControllerWithIdentifier:@"DiscoverTabViewController"];
    Dvc.userid = self.userid;
}

@end
