//
//  GameDiscountTableViewCell.m
//  Jump
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GameDiscountTableViewCell.h"
#import "ChartView.h"
@interface GameDiscountTableViewCell()

@property(nonatomic,strong) ChartView *view;

@end


@implementation GameDiscountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.view = [[ChartView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth - 10, 149)];
    [self.bgview1 addSubview:self.view];
        

        
    
}

-(void)ChartViewData:(GameDisCountModel *)model{
    
    if (model != nil) {
        [self.view ChartViewWithData:model];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
