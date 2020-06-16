//
//  NewWeightEntryViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewWeightEntryViewController : UIViewController

@property (strong, nonatomic) NSString *dataSegue;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITextField *weightField;


@end

NS_ASSUME_NONNULL_END
