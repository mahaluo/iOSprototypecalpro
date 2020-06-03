//
//  NewStoreItemViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "NewStoreItemViewController.h"

@interface NewStoreItemViewController ()

@end

@implementation NewStoreItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.ref = [[FIRDatabase database] reference];
}
- (IBAction)createClicked:(id)sender {
    
    NSString *newName = self.storeItemName.text;
    
    @try {
         [[[self.ref child:@"plans"] child:@"2"] setValue:@{@"plan_name": newName}];
        NSLog(@"create name method succesfully created name");
    } @catch (NSException *exception) {
        NSLog(@"create name method threw an exception");
    } @finally {
        
        
        NSLog(@"end of create name method");
    }
   
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
