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
    NSMutableArray *activeMeals;
    NSTimer* statusTimer;
}
@end

static NSString * const reuseIdentifier = @"Cell";


@implementation CurrentPlanScreenViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _ref = [[FIRDatabase database] reference];
    _userid = [FIRAuth auth].currentUser.uid;

    
    self.planNameLabel.text = [NSString stringWithFormat:@"name: %@", _currentPlan.plan_name];
    self.planKcalLabel.text = [NSString stringWithFormat:@"daily kcal: %@", _currentPlan.plan_kcal];
    self.PlanImageImageView.image = [UIImage imageNamed:_currentPlan.plan_name];
    
    NSLog(@"current plan name, %@", _currentPlan.plan_name);
    NSLog(@"current plan key, %@", _planKey);
    
    statusTimer = [NSTimer scheduledTimerWithTimeInterval:0.0f target:self selector:@selector(checkStatus:) userInfo:nil repeats:YES];
    
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
        activeMeals = [[NSMutableArray alloc] init];
        
        [userPlanRef
         observeEventType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot *snapshot) {
            // Loop over children
            NSEnumerator *children = [snapshot children];
            
            FIRDataSnapshot *child;
            
            while (child = [children nextObject]) {
                
                NSLog(@"%@", child.key);
                NSLog(@"%@", child.value[@"meal_name"]);
                [self->activeMeals addObject:child.value[@"meal_name"]];
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
    if ([activeMeals count] == 0) {
        NSLog(@"activeMeals was 0, number of items is 1");
        return 1;
    }
    else {
        NSLog(@"activeMeals was not 0, number of items from array");
        return [activeMeals count];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    if ([activeMeals count] == 0) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
        imageView.image = [UIImage imageNamed:@"calpro_logo"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.backgroundView = imageView;
    }
    else {
        NSLog(@"setting up cell with meal images");
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
        imageView.image = [UIImage imageNamed:activeMeals[indexPath.item]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.backgroundView = imageView;
    }
    
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


-(void)checkStatus:(NSTimer*)timer
{
    NSLog(@"Timer started");
    
    if([activeMeals count] != 0)
    {
        NSLog(@"meals retrieved");
        [statusTimer invalidate];
        statusTimer = nil;
        [self.PlanMealsCollectionView reloadData];
    }
}

@end
