//
//  DiscoverViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 31/5/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverTabViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *discoverCollectionView;
@property (strong, nonatomic) NSString *userid;

@end

NS_ASSUME_NONNULL_END
