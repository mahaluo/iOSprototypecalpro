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
@property NSArray* plan_meals;
@property NSString* plan_kcal;
@property NSString* plan_protein;
@property NSString* plan_carbs;
@property NSString* plan_fats;

-(instancetype)initFullPlan:(NSString*) plan_name
                   andMeals:(NSArray*) plan_meals
                    andKcal:(NSString*) plan_kcal
                    andProtein:(NSString*) plan_protein
                    andCarbs:(NSString*) plan_carbs
                    andFats:(NSString*) plan_fats;

@end

#endif /* UserPlan_h */
