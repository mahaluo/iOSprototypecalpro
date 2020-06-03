//
//  UserMeal.h
//  calpro_prototype
//
//  Created by Max Häggkvist on 4/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#ifndef UserMeal_h
#define UserMeal_h

@interface UserMeal : NSObject
    
@property NSString *meal_name;
@property (nonatomic) double meal_kcal;
@property (nonatomic) double meal_protein;
@property (nonatomic) double meal_carbs;
@property (nonatomic) double meal_fats;

@end

#endif /* UserMeal_h */
