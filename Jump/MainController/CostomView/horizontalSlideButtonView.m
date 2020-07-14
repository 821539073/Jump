//
//  horizontalSlideButtonView.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "horizontalSlideButtonView.h"
#import "Masonry.h"
#import "RecommdViewController.h"
@interface horizontalSlideButtonView()
@property(nonatomic,strong) NSArray *arr;
@property(nonatomic,strong) UIButton *lastButton;
@property(nonatomic,strong) UILabel *bottomLable;
@property(nonatomic,assign) NSInteger butttonType;
@end

@implementation horizontalSlideButtonView


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    //self.backgroundColor = [UIColor whiteColor];

    return self;
}


-(void)numOfButtonWithArr:(NSArray *)buttonArr horizontalSlideButtonType:(horizontalSlideButtonType) type{
    self.arr = buttonArr;
    self.bottomLable = [[UILabel alloc]init];
    [self addSubview:self.bottomLable];
    self.bottomLable.backgroundColor = [UIColor redColor];
    //self.bottomLable.frame = CGRectMake(80 + self.bounds.size.width/self.arr.count * 0, self.bounds.size.height - 3, self.bounds.size.width/self.arr.count - 40, 3);
    [self.bottomLable mas_makeConstraints:^(MASConstraintMaker *make) {
        makeLeft(self.mas_left, 20);
        makeBottom(self.mas_bottom, -3);
        makeHeight(3);
        makeWidth(DeviceWidth/self.arr.count - 40);
    }];
    if (buttonArr.count != 0) {
        for (int i = 0; i < buttonArr.count; i ++) {
            UIButton *button = [[UIButton alloc]init];
            [self addSubview:button];
            button.tag = 1000 + i;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitle:buttonArr[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            //button.backgroundColor = [UIColor yellowColor];
            if (type == HorizontalSlideButtonType1) {
                button.titleLabel.font = [UIFont systemFontOfSize:16];
                self.bottomLable.hidden = NO;
                self.butttonType = HorizontalSlideButtonType1;
                if (i == 0) {
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                    self.lastButton = button;
                }
                //button.frame = CGRectMake(0 + self.bounds.size.width/buttonArr.count * i, 0, self.bounds.size.width/buttonArr.count, self.bounds.size.height - 3);
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    makeLeft(self.mas_left,(DeviceWidth - 10)/buttonArr.count * i);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    makeWidth((DeviceWidth - 10)/buttonArr.count);
                }];
                

            }else if(type == HorizontalSlideButtonType2){
                button.titleLabel.font = [UIFont systemFontOfSize:14];
                if (i == 0) {
                    button.titleLabel.font = [UIFont systemFontOfSize:16];
                    self.lastButton = button;
                }
                self.bottomLable.hidden = YES;
                self.butttonType = HorizontalSlideButtonType2;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                //button.frame = CGRectMake(0 + self.bounds.size.width/buttonArr.count * i, 0, self.bounds.size.width/buttonArr.count, self.bounds.size.height);
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    makeLeft(self.mas_left,80 * i);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    makeWidth(80);
                }];
            }else if(type == HorizontalSlideButtonType3){
                button.titleLabel.font = [UIFont systemFontOfSize:10];
                self.bottomLable.hidden = YES;
                self.butttonType = HorizontalSlideButtonType3;
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                //button.frame = CGRectMake(0 + self.bounds.size.width/buttonArr.count * i + 15, 0, (self.bounds.size.width - (15 * buttonArr.count))/buttonArr.count, self.bounds.size.height);
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    makeLeft(self.mas_left,45 * i);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    makeWidth(40);
                    makeHeight(19);
                }];
                button.layer.borderWidth = 1;
                button.layer.borderColor = [UIColor blackColor].CGColor;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                if (i == 0) {
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                    button.layer.borderColor = [UIColor redColor].CGColor;
                    self.lastButton = button;
                }
                button.layer.cornerRadius = self.bounds.size.height/2;
                button.layer.masksToBounds = YES;
                
                
            }else if (HorizontalSlideButtonType4){
                
                button.titleLabel.font = [UIFont systemFontOfSize:16];
                self.bottomLable.hidden = NO;
                self.butttonType = HorizontalSlideButtonType1;
                if (i == 0) {
                    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                    self.lastButton = button;
                }
                //button.frame = CGRectMake(0 + self.bounds.size.width/buttonArr.count * i, 0, self.bounds.size.width/buttonArr.count, self.bounds.size.height - 3);
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    makeLeft(self.mas_left,(DeviceWidth - 10)/buttonArr.count * i);
                    make.centerY.mas_equalTo(self.mas_centerY);
                    makeWidth((DeviceWidth - 10)/buttonArr.count);
                }];
                
            }
            
        }
    }
    
    
}


-(void)buttonClick:(UIButton *)sender{
    if(self.lastButton== sender) {
        
    } else{
        if (self.butttonType == HorizontalSlideButtonType1) {
            self.bottomLable.frame = CGRectMake(80 + self.bounds.size.width/self.arr.count * (sender.tag - 1000), self.bounds.size.height - 3, self.bounds.size.width/self.arr.count - 40, 3);
            self.bottomLable.center = CGPointMake(sender.center.x, self.bounds.size.height - 3);
            [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            //将上次点击过的按钮设为黑色
            [self.lastButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
            
        }else if (self.butttonType == HorizontalSlideButtonType2){
            sender.titleLabel.font = [UIFont systemFontOfSize:18];
            self.lastButton.titleLabel.font = [UIFont systemFontOfSize:14];
        }else if(self.butttonType == HorizontalSlideButtonType3){
            sender.layer.borderColor = [UIColor redColor].CGColor;
            [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            self.lastButton.layer.borderColor = [UIColor blackColor].CGColor;
            [self.lastButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
    }
    //[RecommdViewController HorizonButtonClick:sender.titleLabel.text];
    if (self.delegate && [self.delegate respondsToSelector:@selector(siderViewButtonClick:HorizontalSlideButtonView:)]) {
        [self.delegate siderViewButtonClick:sender.tag - 1000 HorizontalSlideButtonView:self];
    }
    
    
    self.lastButton= sender;
}






-(NSString *)SiderButtonClick{
     return  self.lastButton.titleLabel.text;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
