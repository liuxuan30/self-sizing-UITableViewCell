//
//  MyView.m
//  AutoLayoutPractice
//
//  Created by Xuan on 1/7/16.
//  Copyright © 2016 Wingzero. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(CGSize)intrinsicContentSize {
    return CGSizeMake(50, 150);
}

@end
