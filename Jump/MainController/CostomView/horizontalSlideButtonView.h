//
//  horizontalSlideButtonView.h
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    HorizontalSlideButtonType1,
    HorizontalSlideButtonType2,
    HorizontalSlideButtonType3,
    HorizontalSlideButtonType4
}horizontalSlideButtonType;

@protocol HorizontalSlideButtonDelegate <NSObject>

-(void)siderViewButtonClick:(NSInteger)buttonIndex HorizontalSlideButtonView:(id)viwe;

@end

@interface horizontalSlideButtonView : UIView
-(id)initWithFrame:(CGRect)frame;
@property (nonatomic,unsafe_unretained)id<HorizontalSlideButtonDelegate>delegate;
-(void)numOfButtonWithArr:(NSArray *)buttonArr horizontalSlideButtonType:(horizontalSlideButtonType) type;

@end

NS_ASSUME_NONNULL_END
