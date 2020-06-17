//
//  NewMealViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 6/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "NewMealViewController.h"

@interface NewMealViewController ()

@end

@implementation NewMealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)addButtonClicked:(id)sender {
    
    if(self.nameField.text.length > 0 && self.carbsField.text.length > 0 && self.proteinField.text.length > 0 && self.fatsField.text.length > 0) {
        
        NSString* alertMessage = [NSString stringWithFormat:@"name: %@", self.nameField.text];
        
        
        UIAlertController* addAlert;
           
           addAlert = [UIAlertController
                       alertControllerWithTitle:@"adding meal"
                       message:alertMessage
                       preferredStyle:UIAlertControllerStyleAlert];
           
           UIAlertAction* okAction = [UIAlertAction
                                      actionWithTitle:@"ok"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action) {
               self.nameField.text = nil;
               self.proteinField.text = nil;
               self.carbsField.text = nil;
               self.fatsField.text = nil;
           }];
           UIAlertAction* cancelAction = [UIAlertAction
                                          actionWithTitle:@"cancel"
                                          style:UIAlertActionStyleDefault
                                          handler:^(UIAlertAction * action) {}];
           
           [addAlert addAction:okAction];
           [addAlert addAction:cancelAction];
           [self presentViewController:addAlert animated:YES completion:nil];
    }
    else {
        UIAlertController* addAlert;
                
                addAlert = [UIAlertController
                            alertControllerWithTitle:@"oops!"
                            message:@"please fill in all fields"
                            preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction* okAction = [UIAlertAction
                                           actionWithTitle:@"ok"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action) {}];
                
                [addAlert addAction:okAction];
                
                [self presentViewController:addAlert animated:YES completion:nil];
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
