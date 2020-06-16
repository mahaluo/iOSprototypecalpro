//
//  CurrentPlanScreenViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserPlan.h"
#import "UserMeal.h"
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface CurrentPlanScreenViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *PlanMealsCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *PlanImageImageView;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak) UserPlan* currentPlan;
@property (strong, nonatomic) NSString *userid;
@property (weak) NSArray* meals;
@property (weak, nonatomic) IBOutlet UILabel *planNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *planKcalLabel;
@property (weak, nonatomic) NSString *planKey;

-(void)setMeals:(NSArray * _Nullable)meals;

-(void)setCurrentPlan:(UserPlan * _Nullable)currentPlan;

-(void)setUserid:(NSString * _Nonnull)userid;

-(void)setPlanKey:(NSString * _Nullable)planKey;

@end

NS_ASSUME_NONNULL_END
