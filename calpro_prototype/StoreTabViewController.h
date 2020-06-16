//
//  PlanViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 31/5/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@import Firebase;
@import FirebaseDatabase;


NS_ASSUME_NONNULL_BEGIN

@interface StoreTabViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItem;
@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UICollectionView *storeCollectionView;


@property (weak, nonatomic) IBOutlet UILabel *collectionViewLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *collectionViewSegmentedControl;

@end

NS_ASSUME_NONNULL_END
