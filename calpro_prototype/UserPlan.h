//
//  UserPlan.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 4/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//


#ifndef UserPlan_h
#define UserPlan_h

@interface UserPlan : NSObject
    
@property NSString *plan_name;
@property (nonatomic) NSArray* plan_meals;
@property (nonatomic) double plan_kcal;
@property (nonatomic) double plan_protein;
@property (nonatomic) double plan_carbs;
@property (nonatomic) double plan_fats;

@end

#endif /* UserPlan_h */
