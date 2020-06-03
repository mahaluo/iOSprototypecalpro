//
//  SignInViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseAuth;

NS_ASSUME_NONNULL_BEGIN

@interface SignInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

NS_ASSUME_NONNULL_END
