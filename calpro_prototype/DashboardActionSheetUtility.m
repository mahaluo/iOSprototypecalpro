//
//  DashboardActionSheetUtility.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DashboardActionSheetUtility.h"

@implementation DashboardActionSheetUtility

//
//    // INPUT Parameter
//
//    // vc       : ViewController (in which you want to display Alert)
//    // title    : Title text of AlertController
//    // message  : Message text of AlertController
//    // button   : Multiple buttons for AlertController
//

+ (void)
showActionSheetInViewController: (UIViewController *)vc
withTitle: (nullable NSString *)title
andMessage: (nullable NSString *)message
withButtons: (NSArray *)button
cancelAvailable: (BOOL)isCancel
withCompletion: (completion)completionBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int index = 0; index < button.count; index++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:button[index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (completionBlock != nil) {

                completionBlock(index);
            }
        }];
        
        [alertController addAction:action];
    }
    
    if (isCancel) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Cancel"] style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            if (completionBlock != nil) {

                completionBlock((int)[button count]);
            }
        }];
        
        [alertController addAction:action];
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {

        // if device is iPhone
        [vc presentViewController:alertController animated:YES completion:nil];
    } else {
        
        // if device is iPad
        [alertController setModalPresentationStyle:UIModalPresentationPopover];
        
        UIPopoverPresentationController *popoverController = [alertController popoverPresentationController];
        [popoverController setSourceView:[vc view]];
        [popoverController setSourceRect:CGRectMake(CGRectGetMidX([[vc view] bounds]), CGRectGetMidY([[vc view] bounds]), 0, 0)];
        [popoverController setPermittedArrowDirections:UIPopoverArrowDirectionUnknown];
        
        [vc presentViewController:alertController animated:YES completion:nil];
    }
}

@end
