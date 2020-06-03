//
//  NewStoreItemViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface NewStoreItemViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *storeItemName;

@property (weak, nonatomic) IBOutlet UIButton *createButton;


@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

NS_ASSUME_NONNULL_END
