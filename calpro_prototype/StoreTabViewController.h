//
//  PlanViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 31/5/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreTabViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addItem;
@property (strong, nonatomic) NSString *userid;

@end

NS_ASSUME_NONNULL_END
