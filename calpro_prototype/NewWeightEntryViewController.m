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
