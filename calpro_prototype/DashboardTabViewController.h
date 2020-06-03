//
//  DashboardTabViewController.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DashboardTabViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *weightEntryButton;
@property (strong, nonatomic) NSString *userid;
@end

NS_ASSUME_NONNULL_END
