//
//  ProfileTabViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTabViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *optionsTabButton;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSString *userid;
@property (weak, nonatomic) IBOutlet UILabel *planNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *mealNumberLabel;
@property int *plans;
@property int *meals;
@end

NS_ASSUME_NONNULL_END
