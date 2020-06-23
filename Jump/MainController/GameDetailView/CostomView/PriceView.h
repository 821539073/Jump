//
//  PriceView.h
//  Jump
//
//  Created by mac on 2020/6/17.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PriceView : UIView
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *goldLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *cutOff;
@property (weak, nonatomic) IBOutlet UILabel *leftDays;

- (instancetype)initWithFrame:(CGRect)frame;

-(void)payMethod:(NSArray *)methodArr;

@end

NS_ASSUME_NONNULL_END
