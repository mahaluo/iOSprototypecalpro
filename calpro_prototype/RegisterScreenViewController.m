//
//  RegisterViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "RegisterScreenViewController.h"

@interface RegisterScreenViewController ()

@end

@implementation RegisterScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
}
- (IBAction)registerButtonClicked:(id)sender {
    
    
   if ([self confirmCredentials]) {
       @try {
           NSLog(@"firebase tries registering user");
            [[FIRAuth auth]
             createUserWithEmail: self.emailField.text
             password: self.passwordField.text
             completion:^(FIRAuthDataResult *
            _Nullable authResult,
            NSError * _Nullable error) {
                if (error){
                    NSLog(@"error happened");
                    [self sendRegisterAlert:@"something bad happened! did not register." andResult:false];
                    self.emailField.text = nil;
                    self.confirmEmailField.text = nil;
                    self.passwordField.text = nil;
                    self.confirmPasswordField.text = nil;
                }
                else {
                    NSLog(@"nothing bad happened");
                    [self sendRegisterAlert:@"you rule! registered successfully." andResult:true];
                    self.emailField.text = nil;
                    self.confirmEmailField.text = nil;
                    self.passwordField.text = nil;
                    self.confirmPasswordField.text = nil;
                    
                }
            }];
       } @catch (NSException *exception) {
           NSLog(@"%@", exception.reason);
           [self sendRegisterAlert:@"something bad happened! did not register." andResult:false];
       } @finally {
        
       }
      
   }
   else {
       
   }
    
}

- (BOOL) confirmCredentials {
    NSLog(@"confirming credentials");
    if ([self.emailField.text isEqualToString:self.confirmEmailField.text] && [self.passwordField.text isEqualToString:self.confirmPasswordField.text]) {
        NSLog(@"field values match");
        return true;
    }
    else {
        NSLog(@"field values does not match");
        self.passwordField.text = nil;
        self.confirmPasswordField.text = nil;
        return false;
    }
}

-(void)sendRegisterAlert:(NSString *) message andResult:(Boolean) success {
    
    UIAlertController* registerAlert;
  
    if (success) {
        registerAlert = [UIAlertController
        alertControllerWithTitle:@"register success!"
        message:message
        preferredStyle:UIAlertControllerStyleAlert];
    }
    else {
        registerAlert = [UIAlertController
        alertControllerWithTitle:@"register fail!"
        message:message
        preferredStyle:UIAlertControllerStyleAlert];
    }
   
    
    UIAlertAction* okAction = [UIAlertAction
                                 actionWithTitle:@"ok"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {}];
    
    [registerAlert addAction:okAction];

    
    [self presentViewController:registerAlert animated:YES completion:nil];
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
