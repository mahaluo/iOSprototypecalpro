//
//  DashboardTabViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "DashboardTabViewController.h"
#import "NewWeightEntryViewController.h"
#import "TabBarViewController.h"

@interface DashboardTabViewController ()

@end

@implementation DashboardTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)weightEntryClicked:(id)sender {
  
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
}

- (void)setUserid:(NSString *) userid {
    if(_userid != userid) {
        _userid = userid;
    }
}

@end
