//
//  mainCardView.h
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    MainCardViewType1,
    MainCardViewType2,
    MainCardViewType3
}MainCardViewType;
@interface MainCardView : UIView

@property(nonatomic,strong) UIViewController *controller;

-(id)init;
-(void)drawVieWithType:(MainCardViewType)type;


-(void)FullScreenDiscountTypeView;
@end

NS_ASSUME_NONNULL_END
