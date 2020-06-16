//
//  CurrentPlanScreenViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 3/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "CurrentPlanScreenViewController.h"

@interface CurrentPlanScreenViewController ()
{
    NSArray *planMeals;
}
@end

static NSString * const reuseIdentifier = @"Cell";


@implementation CurrentPlanScreenViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _ref = [[FIRDatabase database] reference];
    
    planMeals = @[
        @[@"user_meal_2",
          @"user_meal_4"]];
    
    self.planNameLabel.text = [NSString stringWithFormat:@"name: %@", _currentPlan.plan_name];
    self.planKcalLabel.text = [NSString stringWithFormat:@"daily kcal: %@", _currentPlan.plan_kcal];
    self.PlanImageImageView.image = [UIImage imageNamed:_currentPlan.plan_name];
    
    NSLog(@"current plan name, %@", _currentPlan.plan_name);
    NSLog(@"current plan key, %@", _planKey);

    [self getMeals];
    
    self.PlanMealsCollectionView.dataSource = self;
    self.PlanMealsCollectionView.delegate = self;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)getMeals {
   
    @try {
        FIRDatabaseReference *userPlanRef = [[[[self.ref child:_userid] child:@"plans"] child:_planKey] child:@"meals"];
        NSLog(@"firebase ref");
        NSLog(@"%@", userPlanRef);
        planMeals = [[NSMutableArray alloc] init];
        
        [userPlanRef
         observeEventType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot *snapshot) {
            // Loop over children
            NSEnumerator *children = [snapshot children];
            
            FIRDataSnapshot *child;
            
            while (child = [children nextObject]) {
                
                NSLog(@"%@", child.key);
                NSLog(@"%@", child.value[@"meal_name"]);
            }
            
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"something bad happened in store");
    } @finally {
        NSLog(@"getmeals finished");
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of items
    return [[planMeals objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
    imageView.image = [UIImage imageNamed:planMeals[indexPath.section][indexPath.item]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = imageView;
    
    cell.tag = indexPath.row;
    
    
    UIView* selectionView = [[UIView alloc] initWithFrame:cell.bounds];
    selectionView.backgroundColor = [UIColor colorWithDisplayP3Red:1 green:1 blue:1 alpha:0.7];
    cell.selectedBackgroundView = selectionView;
    
    return cell;
}


#pragma mark <UICollectionViewDataSource>
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat padding = 5;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    
    return CGSizeMake(cellSize / 2, cellSize / 2);
    
}

@end
