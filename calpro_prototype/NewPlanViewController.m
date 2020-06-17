//
//  NewPlanViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 6/6/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "NewPlanViewController.h"
#import "UserPlan.h"
#import "UserMeal.h"

@interface NewPlanViewController ()
{
    NSMutableArray *mealNames;
    NSMutableArray *storedMeals;
    NSMutableArray *planMeals;
    NSString *collection;
    NSTimer* statusTimer;
    BOOL mealsLoaded;
}
@property (nonatomic, strong) NSMutableArray* selectedMeals;
@end

@implementation NewPlanViewController

static NSString * const reuseIdentifier = @"cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userid = [FIRAuth auth].currentUser.uid;
    _ref = [[FIRDatabase database] reference];
    
    self.mealsCollectionView.allowsMultipleSelection = YES;
    self.selectedMeals = [NSMutableArray array];
    planMeals = [[NSMutableArray alloc] init];
    mealsLoaded = NO;
    collection = @"meals";
    statusTimer = [NSTimer scheduledTimerWithTimeInterval:0.0f target:self selector:@selector(checkStatus:) userInfo:nil repeats:YES];
    
    [self getMeals];
    
    self.mealsCollectionView.dataSource = self;
    self.mealsCollectionView.delegate = self;
    self.planCollectionView.dataSource = self;
    self.planCollectionView.delegate = self;
    
}

- (IBAction)addMealClicked:(id)sender {
    
    collection = @"plan";
    
    for (NSString* meal in _selectedMeals) {
        NSLog(@"adding meal to planmeals");
        [planMeals addObject:meal];
    }
    
    
    [self.planCollectionView reloadData];
}

- (IBAction)savePlanClicked:(id)sender {
}

- (void) getMeals {
    
    @try {
        FIRDatabaseReference *userMealRef = [[self.ref child:_userid] child:@"meals"];
        mealNames = [[NSMutableArray alloc] init];
        
        NSLog(@"firebase ref");
        NSLog(@"%@", _ref);
        [userMealRef
         observeEventType:FIRDataEventTypeValue
         withBlock:^(FIRDataSnapshot *snapshot) {
            // Loop over children
            NSEnumerator *children = [snapshot children];
            
            
            FIRDataSnapshot *child;
            
            while (child = [children nextObject]) {
                
                NSLog(@"%@", child.key);
                NSLog(@"%@", child.value[@"meal_name"]);
                
                UserMeal *storedMeal = [[UserMeal alloc] initFullMeal:child.value[@"meal_name"]
                                                              andKcal:child.value[@"meal_kcal"]
                                                           andProtein:child.value[@"meal_protein"]
                                                             andCarbs:child.value[@"meal_carbs"]
                                                              andFats:child.value[@"meal_fats"]];
                NSLog(@"got a meal");
                [self->storedMeals addObject:storedMeal];
                [self->mealNames addObject:child.value[@"meal_name"]];
            }
            
            self->mealsLoaded = YES;
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"something bad happened in store");
    } @finally {
        NSLog(@"meals loaded from realtime database");
    }
}

-(void)checkStatus:(NSTimer*)timer
{
    if(mealsLoaded)
    {
        NSLog(@"meals retrived");
        [statusTimer invalidate];
        statusTimer = nil;
        [self.mealsCollectionView reloadData];
    }
}




#pragma mark <UICollectionViewDataSource>
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of items
    if ([collection isEqualToString:@"meals"]) {
        
        if ([mealNames count] == 0) {
            NSLog(@"mealnames was 0");
            return 1;
        }
        else {
            NSLog(@"collection view reload with mealnames");
            return [mealNames count];
        }
    }
    else {
        if ([planMeals count] == 0) {
            NSLog(@"plan was 0");
            return 1;
        }
        else {
            NSLog(@"collection view reload with plan meals");
            return [planMeals count];
        }
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([collection isEqualToString:@"meals"]) {
        NSLog(@"collection was meals");
        
        if ([mealNames count] == 0) {
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
            imageView.image = [UIImage imageNamed:@"calpro_logo"];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            cell.backgroundView = imageView;
        }
        else {
            NSLog(@"setting up cell with meal images");
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
            imageView.image = [UIImage imageNamed:mealNames[indexPath.item]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            cell.backgroundView = imageView;
            
            UIView* selectionView = [[UIView alloc] initWithFrame:cell.bounds];
            selectionView.backgroundColor = [UIColor colorWithDisplayP3Red:1 green:1 blue:1 alpha:0.7];
            cell.selectedBackgroundView = selectionView;
            
            NSString* mealName = mealNames[indexPath.item];
            
            if ([self.selectedMeals containsObject:mealName]) {
                cell.selected = YES;
            }
            else {
                cell.selected = NO;
            }
        }
    }
    else {
         NSLog(@"collection was plans");
        if ([planMeals count] == 0) {
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
            imageView.image = [UIImage imageNamed:@"calpro_logo"];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            cell.backgroundView = imageView;
        }
        else {
            NSLog(@"setting up cell with meal images");
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
            imageView.image = [UIImage imageNamed:planMeals[indexPath.item]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            cell.backgroundView = imageView;
        }
    }
    
    
    cell.tag = indexPath.row;
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat padding = 3;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    
    return CGSizeMake(cellSize / 4, cellSize / 4);
    
}


#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* selectedMeal = mealNames[indexPath.item];
    [self.selectedMeals addObject:selectedMeal];
    self.addMealButton.enabled = YES;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* deselectedMeal = mealNames[indexPath.item];
    [self.selectedMeals removeObject:deselectedMeal];
    
    if (_selectedMeals.count > 0) {
        self.addMealButton.enabled = YES;
    }
    else {
        self.addMealButton.enabled = NO;
    }
}







/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    <#code#>
//}
//
//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    <#code#>
//}
//
//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//
//- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//    <#code#>
//}
//
//- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
//    <#code#>
//}
//
//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
//    <#code#>
//}
//
//- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
//    <#code#>
//}
//
//- (void)setNeedsFocusUpdate {
//    <#code#>
//}
//
//- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
//    <#code#>
//}
//
//- (void)updateFocusIfNeeded {
//    <#code#>
//}

@end
