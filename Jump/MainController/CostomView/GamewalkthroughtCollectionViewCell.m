//
//  GamewalkthroughtCollectionViewCell.m
//  Jump
//
//  Created by mac on 2020/6/20.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GamewalkthroughtCollectionViewCell.h"

@implementation GamewalkthroughtCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2;
    self.imageView.layer.masksToBounds = YES;
}

@end
