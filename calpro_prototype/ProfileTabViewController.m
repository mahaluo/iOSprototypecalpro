//
//  ProfileTabViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "ProfileTabViewController.h"
#import "DashboardActionSheetUtility.h"
#import "StartScreenViewController.h"

@interface ProfileTabViewController ()

@end

@implementation ProfileTabViewController

@synthesize plans = _plans;
@synthesize meals = _meals;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ref = [[FIRDatabase database] reference];
    
    NSLog(@"user id from tab bar controller");
    NSLog(@"%@", _userid); 
    
    [self getProfileInfo];
    
    
}
- (IBAction)optionsButtonClicked:(id)sender {

      [[self view] endEditing:YES];
    
      [DashboardActionSheetUtility
       showActionSheetInViewController:self
       withTitle:nil
       andMessage:[NSString stringWithFormat:@"profile settings"]
       withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Edit profile picture"], [NSString stringWithFormat:@"Sign out"], nil]
       cancelAvailable:YES
       withCompletion:^(int index) {
      
          if (index == 0) {
              NSLog(@"profile picture clicked");
          }
          else if (index == 1) {
              NSLog(@"sign out clicked");
              NSError *signOutError;
              BOOL status = [[FIRAuth auth] signOut:&signOutError];
              if (!status) {
                NSLog(@"Error signing out: %@", signOutError);
                return;
              }
              else {
                  NSLog(@"signed out successfully");
                  UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                  StartScreenViewController* sc = [sb instantiateViewControllerWithIdentifier:@"StartScreenViewController"];
                  sc.modalPresentationStyle = UIModalPresentationFullScreen;
                  [self presentViewController:sc animated:YES completion:nil];
              }
          }
          else if (index == 2) {
              NSLog(@"cancel clicked");
          }
      }];
}


- (void)getProfileInfo {
    
    //get number of plans
    @try {
        
        _userid = [FIRAuth auth].currentUser.uid;
        
        
        FIRDatabaseReference *userPlanRef = [[self.ref child:_userid] child:@"plans"];
        _plans = 0;
        
        [userPlanRef
        observeEventType:FIRDataEventTypeValue
        withBlock:^(FIRDataSnapshot *snapshot) {
          // Loop over children
          NSEnumerator *children = [snapshot children];
            
          FIRDataSnapshot *child;
            
          while (child = [children nextObject]) {
              
              NSLog(@"%@", child.key);
              _plans = child.key.intValue;
          }
           
        NSLog(@" number of plans found %d", _plans);
           self.planNumberLabel.text = [NSString stringWithFormat:@"stored plans: %d", _plans];
        }];
        
        
        
    
    } @catch (NSException *exception) {
        
    } @finally {
        
    };
    
    
    
    //get number of meals
    @try {
        
    
        FIRDatabaseReference *userMealRef = [[self.ref child:_userid] child:@"meals"];
        _meals = 0;
        
        [userMealRef
        observeEventType:FIRDataEventTypeValue
        withBlock:^(FIRDataSnapshot *snapshot) {
          // Loop over children
          NSEnumerator *children = [snapshot children];
            
          FIRDataSnapshot *child;
            
          while (child = [children nextObject]) {
              
              NSLog(@"%@", child.key);
              _meals = child.key.intValue;
          }
           
        NSLog(@" number of meals found %d", _meals);
            
            
            self.mealNumberLabel.text = [NSString stringWithFormat:@"stored meals: %d", _meals];
        }];
        
        
        
    
    } @catch (NSException *exception) {
        
    } @finally {
        
    };
    
    
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
