//
//  ViewController.m
//  AutoLayoutPractice
//
//  Created by Xuan on 1/7/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController {
    NSArray *images;
    NSArray *labels;
    UITableView *tView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    images = @[@"Earth", @"Alexstrasza_full"];
    labels = @[@"haha", @"asdfasdfasdfasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdasdfasdfsadfasdfasdfasdfasdfasdfasdf"];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.imgView.image = [UIImage imageNamed:images[indexPath.row]];
    cell.labelView.text = labels[indexPath.row];
    return cell;
}

@end
