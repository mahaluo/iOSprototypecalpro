//
//  DiscoverViewController.m
//  calpro_prototype
//
//  Created by Max Häggkvist on 31/5/20.
//  Copyright © 2020 Max Häggkvist. All rights reserved.
//

#import "DiscoverTabViewController.h"


@interface DiscoverTabViewController ()
{
    NSArray *discoverPlans;
}
@end

@implementation DiscoverTabViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    discoverPlans = @[
    @[@"discover_plan_1",
      @"discover_plan_2",
      @"discover_plan_3",
      @"discover_plan_4",
      @"discover_plan_5",
      @"discover_plan_6",
      @"discover_plan_7",
      @"discover_plan_8",
      @"discover_plan_9",
      @"discover_plan_10"]];
   
   
      self.discoverCollectionView.dataSource = self;
      self.discoverCollectionView.delegate = self;
      [self.discoverCollectionView setAllowsMultipleSelection:YES];
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
      NSLog(@"collection was reloaded, %d", [[discoverPlans objectAtIndex:section] count]);
    return [[discoverPlans objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.frame];
    imageView.image = [UIImage imageNamed:discoverPlans[indexPath.section][indexPath.item]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.backgroundView = imageView;
    
    cell.tag = indexPath.row;
    
    
    UIView* selectionView = [[UIView alloc] initWithFrame:cell.bounds];
    selectionView.backgroundColor = [UIColor colorWithDisplayP3Red:1 green:1 blue:1 alpha:0.7];
    cell.selectedBackgroundView = selectionView;
  
    return cell;
}


#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
}


#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
             layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat padding = 2;
    CGFloat cellSize = collectionView.frame.size.width - padding;
    
    return CGSizeMake(cellSize / 2, cellSize / 2);

}

@end
