//
//  DashboardActionSheetUtility.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DashboardActionSheetUtility : NSObject

typedef void (^ _Nullable completion)(int index);

+ (void)
showActionSheetInViewController: (UIViewController *)vc withTitle: (nullable NSString *)title andMessage: (nullable NSString *)message withButtons: (NSArray *)button cancelAvailable: (BOOL)isCancel withCompletion: (completion)completionBlock;



@end

NS_ASSUME_NONNULL_END
