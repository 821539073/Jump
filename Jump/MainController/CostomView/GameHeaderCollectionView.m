//
//  GameHeaderCollectionView.m
//  Jump
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameHeaderCollectionView.h"

@implementation GameHeaderCollectionView

-(void)setHeaderTitle:(NSString *)title{
    
    self.backgroundColor = [UIColor greenColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height)];
    [self addSubview:lable];
    lable.text = title;
    
    
}


@end
