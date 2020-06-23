//
//  PriceView.m
//  Jump
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "PriceView.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation PriceView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"PriceView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

-(void)payMethod:(NSArray *)methodArr{
    ViewCornerRadius(self.cutOff, 8);
    if (methodArr.count != 0) {
        for (int i = 0; i < methodArr.count; i++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5 + 27 * i, 35, 22 ,13)];
            [self addSubview:imageView];
            [imageView sd_setImageWithURL:[NSURL URLWithString:methodArr[i]]];
        }
    }

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
