//
//  SignInViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "SignInViewController.h"
#import "DashboardTabViewController.h"
#import "TabBarViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)signInClicked:(id)sender {
    
    [[FIRAuth auth] signInWithEmail:self.emailField.text
                           password:self.passwordField.text
                         completion:^(FIRAuthDataResult * _Nullable authResult,
                                      NSError * _Nullable error) {
        if (error){
            NSLog(@"error happened");
            if (self.emailField.text.length != 0 && self.passwordField.text.length != 0) {
                UIAlertController* signInAlert;
                
                signInAlert = [UIAlertController
                     alertControllerWithTitle:@"oops!"
                     message:@"could not sign in!"
                     preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* okAction = [UIAlertAction
                                             actionWithTitle:@"ok"
                                             style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction * action) {}];
                
                [signInAlert addAction:okAction];
                [self presentViewController:signInAlert animated:YES completion:nil];
            }
            
        }
        else {
            //move to dashboard
            NSLog(@"nothing bad happened");
            self.emailField.text = nil;
            self.passwordField.text = nil;
            NSLog(@"signing in user... user id is: ");
            NSLog(@"%@", authResult.user.uid);
            UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TabBarViewController* tc = [sb instantiateViewControllerWithIdentifier:@"TabBarViewController"];
            tc.userid = authResult.user.uid;
            tc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:tc animated:YES completion:nil];
        }
    
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
}


@end
