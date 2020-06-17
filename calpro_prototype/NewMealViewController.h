//
//  NewMealViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 6/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewMealViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *proteinField;
@property (weak, nonatomic) IBOutlet UITextField *carbsField;
@property (weak, nonatomic) IBOutlet UITextField *fatsField;

@end

NS_ASSUME_NONNULL_END
