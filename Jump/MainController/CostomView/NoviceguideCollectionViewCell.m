//
//  NoviceguideCollectionViewCell.m
//  Jump
//
//  Created by mac on 2020/6/26.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "NoviceguideCollectionViewCell.h"

@implementation NoviceguideCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    self.imageView.layer.cornerRadius = 4.0f;
    self.imageView.layer.masksToBounds = YES;
    
    CAGradientLayer *gradint = [CAGradientLayer layer];
    gradint.frame = CGRectMake(0, 0, DeviceWidth - 10, 180);

    
    gradint.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] colorWithAlphaComponent:0].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.3].CGColor,nil];
    [self.imageView.layer insertSublayer:gradint atIndex:0];
}

@end
