//
//  ViewController.m
//  AutoLayoutPractice
//
//  Created by Xuan on 1/7/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "MyCollectionViewCell.h"
#import "AnotherCollectionViewCell.h"
#import "MyFlowLayout.h"

@interface ViewController () <UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController {
    NSArray *images;
    NSArray *labels;
    UITableView *tView;
    UICollectionView *cView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    images = @[@"Earth", @"Alexstrasza_full"];
    labels = @[@"haha", @"asdfasdfasdfasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdfasdfasdfasdfasdf"];
    
//    [self buildTableView];
    [self buildCollectionView];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"view did layout subviews");
}

-(void)buildTableView {
    CGRect f = [[UIScreen mainScreen] bounds];
    tView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, f.size.width, f.size.height)];
    tView.dataSource = self;
    
    /**
     *  this is important, setting this will tell table view its row height is dynamic
     *
     */
    tView.estimatedRowHeight = 50;
    
    
    [tView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
    [self.view addSubview:tView];
}

-(void)buildCollectionView {
    CGRect f = [[UIScreen mainScreen] bounds];
    cView = [[UICollectionView alloc] initWithFrame:f collectionViewLayout:[[MyFlowLayout alloc] init]];
    cView.backgroundColor = [UIColor whiteColor];
    
    /**
     *  This method is important to call, so the cell can self-sizing
     */
    ((UICollectionViewFlowLayout *)cView.collectionViewLayout).estimatedItemSize = CGSizeMake(f.size.width, 50);
    
    [cView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"myCollectionCell"];
    cView.dataSource = self;
    cView.delegate = self;
    [self.view addSubview:cView];
}

#pragma mark - UITableViewDataSouce
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.imgView.image = [UIImage imageNamed:images[indexPath.row % images.count]];
    cell.labelView.text = labels[indexPath.row % images.count];
    
    return cell;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:images[indexPath.row % images.count]];
    cell.labelView.text = labels[indexPath.row % labels.count];
    
    return cell;
}

@end
