//
//  UserMeal.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 4/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserMeal.h"

@implementation UserMeal

-(instancetype)
initFullMeal:(NSString*) meal_name
andKcal:(double)meal_kcal
andProtein:(double)meal_protein
andCarbs:(double)meal_carbs
andFats:(double)meal_fats {
    
    if (self = [super init]) {
        //initialize self
        self.meal_name = meal_name;
        self.meal_kcal = meal_kcal;
        self.meal_protein = meal_protein;
        self.meal_carbs = meal_carbs;
        self.meal_fats = meal_fats;
    }
          
    return self;
}

@end
