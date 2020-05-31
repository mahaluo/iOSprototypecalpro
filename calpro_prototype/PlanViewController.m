//
//  PlanViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 31/5/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "PlanViewController.h"

@interface PlanViewController ()
{
    NSArray *planMeals;
}
@end

@implementation PlanViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     planMeals = @[
     @[@"user_meal_1",
       @"user_meal_2",
       @"user_meal_3",
       @"user_meal_4",
       @"user_meal_5",
       @"user_meal_6"]];
    
    
    self.planMealsCollectionView.dataSource = self;
    self.planMealsCollectionView.delegate = self;
    [self.planMealsCollectionView setAllowsMultipleSelection:YES];
    
    self.planImage.image = [UIImage imageNamed:@"user_current_plan"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
             layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat padding = 5;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    
    return CGSizeMake(cellSize / 2, cellSize / 2);

}
@end
