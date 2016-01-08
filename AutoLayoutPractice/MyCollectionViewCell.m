//
//  MyCollectionViewCell.m
//  AutoLayoutPractice
//
//  Created by Xuan on 1/7/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

/**
 *  This is essential to make each cell has equal width
 */
-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    UICollectionViewLayoutAttributes *layoutAttrs = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    layoutAttrs.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, layoutAttrs.size.height);
    
    return layoutAttrs;
}

@end
