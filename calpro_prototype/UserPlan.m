//
//  UserPlan.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 4/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserPlan.h"


@implementation UserPlan


-(instancetype)
initFullPlan:(NSString*) plan_name
andMeals:(NSArray*) plan_meals
andKcal:(double)plan_kcal
andProtein:(double)plan_protein
andCarbs:(double)plan_carbs
andFats:(double)plan_fats {
    
    if (self = [super init]) {
        //initialize self
        self.plan_name = plan_name;
        self.plan_meals = plan_meals;
        self.plan_kcal = plan_kcal;
        self.plan_protein = plan_protein;
        self.plan_carbs = plan_carbs;
        self.plan_fats = plan_fats;
    }
          
    return self;
}

@end

