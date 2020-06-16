//
//  NewWeightEntryViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "NewWeightEntryViewController.h"

@interface NewWeightEntryViewController ()

@end

@implementation NewWeightEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self configureView];
}
- (IBAction)addClicked:(id)sender {
    
    if (_weightField.text.boolValue) {
        UIAlertController* addAlert;
                          
                          addAlert = [UIAlertController
                               alertControllerWithTitle:@"success"
                               message:@"added new weight"
                               preferredStyle:UIAlertControllerStyleAlert];
                          
                          UIAlertAction* okAction = [UIAlertAction
                                                       actionWithTitle:@"ok"
                                                       style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                              self->_weightField.text = @"";
                          }];
                          
                          [addAlert addAction:okAction];
                          [self presentViewController:addAlert animated:YES completion:nil];
    }
    else {
        UIAlertController* emptyAlert;
                          
                          emptyAlert = [UIAlertController
                               alertControllerWithTitle:@"oops!"
                               message:@"weight field looks empty"
                               preferredStyle:UIAlertControllerStyleAlert];
                          
                          UIAlertAction* okAction = [UIAlertAction
                                                       actionWithTitle:@"ok"
                                                       style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {}];
                          
                          [emptyAlert addAction:okAction];
                          [self presentViewController:emptyAlert animated:YES completion:nil];
    }
   
}
- (void)configureView {
    if ([_dataSegue isEqualToString:@"enterDate"]) {
        
    
        UIDatePicker* datePicker = [[UIDatePicker alloc] initWithFrame:self.topView.frame];
        UITextField* weightField = [[UITextField alloc] initWithFrame:self.topView.frame];
        UIButton* enterButton = [[UIButton alloc] initWithFrame:self.topView.frame];
        
        enterButton.titleLabel.text = @"enter";
        
        [self.topView addSubview:datePicker];
        [self.topView addSubview:weightField];
        [self.topView addSubview:enterButton];
    }
}
- (void)setDataSegue:(NSString *)dataSegue {
    if(_dataSegue != dataSegue) {
        _dataSegue = dataSegue;
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
