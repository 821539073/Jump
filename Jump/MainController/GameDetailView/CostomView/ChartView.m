//
//  ChartView.m
//  Jump
//
//  Created by mac on 2020/6/18.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "ChartView.h"

#define bottomExcursion 20
#define leftExcursion  40
#define selfWidth  self.frame.size.width
#define selfHeight  self.frame.size.height

@interface ChartView()

//@property(nonatomic, strong) UIBezierPath *bezier;

@end


@implementation ChartView



-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor grayColor];
    //[self charView];
    

    return self;
}

-(void)ChartViewWithData:(GameDisCountModel *)model{
    
    [self drawXbutton:model.data.timeArr orignPrice:model.data.priceRaw price:model.data.priceArr];
   // [self drawYbutton:@[@"1",@"2",@"1",@"2"]];
    
}


-(void)drawYbutton:(NSArray *)yArr{
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(leftExcursion + 1 ,selfHeight - bottomExcursion)];
    for (int i = 0; i < yArr.count; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, selfHeight - bottomExcursion -  (selfHeight - bottomExcursion)/yArr.count * (i + 1), leftExcursion, (selfHeight - bottomExcursion)/yArr.count)];
        [self addSubview:button];
        [button.titleLabel setFont:[UIFont systemFontOfSize:10]];
        button.titleLabel.numberOfLines = 0;
        [button setTitle:yArr[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor brownColor];
        
        //上移一个Button 高
        [linePath addLineToPoint:CGPointMake(leftExcursion + 1,1)];
        //右移五像素 标点
        [linePath addLineToPoint:CGPointMake(leftExcursion + 1 + 5,1)];
        //回中心点
        [linePath moveToPoint:CGPointMake(leftExcursion + 1,1)];
        //去Button上部
        [linePath addLineToPoint:CGPointMake(leftExcursion + 1,0)];
    }
    
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    lineLayer.lineWidth = 1;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = nil; // 默认为blackColor
    
    [self.layer addSublayer:lineLayer];
}

-(void)drawXbutton:(NSArray *)xArr orignPrice:(float)priceRaw price:(NSArray *)priceArr{
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    UIBezierPath *chartPath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(leftExcursion ,selfHeight - bottomExcursion - 1)];
    for (int i = 0; i < xArr.count; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(leftExcursion + (selfWidth - leftExcursion)/(xArr.count) * i, selfHeight - bottomExcursion, (selfWidth - leftExcursion)/(xArr.count), bottomExcursion)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:5]];
        button.titleLabel.numberOfLines = 0;
        [self addSubview:button];
        //上移 1 像素
        [linePath addLineToPoint:CGPointMake(button.frame.origin.x + button.bounds.size.width/2,selfHeight - bottomExcursion - 1)];
        //上移五像素 标点
        [linePath addLineToPoint:CGPointMake(button.frame.origin.x + button.bounds.size.width/2,selfHeight - bottomExcursion - 1 - 5)];
        //回中心点
        [linePath moveToPoint:CGPointMake(button.frame.origin.x +button.bounds.size.width/2,selfHeight - bottomExcursion - 1)];
        //去Button尾部
        [linePath addLineToPoint:CGPointMake(button.frame.origin.x + button.bounds.size.width,selfHeight - bottomExcursion - 1)];
        NSArray *tempArr = [xArr[i] componentsSeparatedByString:@"-"];
        [button setTitle:[NSString stringWithFormat:@"%@\n%@-%@",tempArr[0],tempArr[1],tempArr[2]] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor brownColor];
        
        UIButton *clickButton = [[UIButton alloc]initWithFrame:CGRectMake(leftExcursion + (selfWidth - leftExcursion)/(xArr.count) * i ,0, (selfWidth - leftExcursion)/(xArr.count), selfHeight - bottomExcursion)];
        [self addSubview:clickButton];
        clickButton.backgroundColor = [UIColor yellowColor];
        float tempPriceRaw;
        if (priceRaw < 1000) {
            tempPriceRaw = ceil(priceRaw/100) * 100;
        }else if(priceRaw < 100){
            tempPriceRaw = ceil(priceRaw/10) * 10;
        }else{
            tempPriceRaw = ceil(priceRaw);
        }
        
        float percentage = [priceArr[i] floatValue]/tempPriceRaw;
        
        float PointHeight =  clickButton.bounds.size.height - clickButton.bounds.size.height * percentage;
        
        
        if (i == 0) {
            [chartPath moveToPoint:CGPointMake(button.center.x,PointHeight)];
        }else{
            [chartPath addLineToPoint:CGPointMake(button.center.x,PointHeight)];
            [chartPath addLineToPoint:CGPointMake(button.center.x,PointHeight)];
        }
    }
    
    CAShapeLayer *lineLayerLine = [CAShapeLayer layer];
    lineLayerLine.lineWidth = 1;
    lineLayerLine.strokeColor = [UIColor greenColor].CGColor;
    lineLayerLine.path = chartPath.CGPath;
    lineLayerLine.fillColor = nil; // 默认为blackColor
    [self.layer addSublayer:lineLayerLine];
    
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 1;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = nil; // 默认为blackColor
    [self.layer addSublayer:lineLayer];
    
    
    if (priceRaw < 1000) {
        float tempPriceRaw = ceil(priceRaw/100);
        NSString *tempStr = [NSString stringWithFormat:@"%d", (int)tempPriceRaw * 100];
        [self drawYbutton:@[tempStr]];
    }else if(priceRaw < 100){
        float tempPriceRaw = ceil(priceRaw/10);
        NSString *tempStr = [NSString stringWithFormat:@"%d", (int)tempPriceRaw * 10];
        [self drawYbutton:@[tempStr]];
    }else if(priceRaw < 10){
        float tempPriceRaw = ceil(priceRaw);
        NSString *tempStr = [NSString stringWithFormat:@"%d", (int)tempPriceRaw];
        [self drawYbutton:@[tempStr]];
    }
    
}


-(void)charView{
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    // 起点
    [linePath moveToPoint:CGPointMake(20 , self.frame.size.height - 5)];
    // 其他点
    [linePath addLineToPoint:CGPointMake(20, 5)];
    [linePath moveToPoint:CGPointMake(20 , self.frame.size.height - 5)];
    [linePath addLineToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 5)];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    lineLayer.lineWidth = 1;
    lineLayer.strokeColor = [UIColor greenColor].CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = nil; // 默认为blackColor
    
    [self.layer addSublayer:lineLayer];
    
}

@end
