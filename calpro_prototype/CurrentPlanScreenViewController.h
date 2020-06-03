//
//  CurrentPlanScreenViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrentPlanScreenViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *PlanMealsCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *PlanImageImageView;

@end

NS_ASSUME_NONNULL_END
