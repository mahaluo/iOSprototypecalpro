//
//  NewPlanViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 6/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;


NS_ASSUME_NONNULL_BEGIN

@interface NewPlanViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *kcalLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbsLabel;
@property (weak, nonatomic) IBOutlet UILabel *proteinLabel;
@property (weak, nonatomic) IBOutlet UIButton *addMealButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *planNameField;
@property (weak, nonatomic) IBOutlet UICollectionView *mealsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *planCollectionView;

@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

NS_ASSUME_NONNULL_END
