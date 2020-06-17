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
{
    NSArray* months;
    NSString *monthNumber;
    int monthInt;
}
@end

@implementation DashboardTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    months = @[@"January",
               @"February",
               @"March",
               @"April",
               @"May",
               @"June",
               @"July",
               @"August",
               @"September",
               @"October",
               @"November",
               @"December"];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFor = [[NSDateFormatter alloc]init];
    [dateFor setDateFormat:@"M"];
    //[dateFor setDateFormat:@"M"]; // Use single M for avoid 0 before month number
    monthNumber = [dateFor stringFromDate:date];
    NSLog(@"month: %@", monthNumber);
    monthInt = [monthNumber intValue];
    monthInt--;
    _navTitle.title = [months objectAtIndex:monthInt];
}
- (IBAction)weightEntryClicked:(id)sender {
    
}

- (IBAction)forwardClicked:(id)sender {
    if (monthInt == 11) {
        monthInt = 0;
    }
    else {
         monthInt++;
    }
    _navTitle.title = [months objectAtIndex:monthInt];
}
- (IBAction)backwardsClicked:(id)sender {
    if (monthInt == 0) {
        monthInt = 11;
    }
    else {
        monthInt--;
    }
    _navTitle.title = [months objectAtIndex:monthInt];
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
