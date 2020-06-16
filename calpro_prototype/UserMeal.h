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
@property (nonatomic) NSString *meal_kcal;
@property (nonatomic) NSString *meal_protein;
@property (nonatomic) NSString *meal_carbs;
@property (nonatomic) NSString *meal_fats;


-(instancetype)initFullMeal:(NSString*) meal_name
                   andKcal:(NSArray*) meal_kcal
                    andProtein:(NSString*) meal_protein
                    andCarbs:(NSString*) meal_carbs
                    andFats:(NSString*) meal_fats;
                  
@end

#endif /* UserMeal_h */
