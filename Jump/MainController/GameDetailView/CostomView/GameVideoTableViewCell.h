//
//  GameVideoTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/15.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "Masonry.h"
NS_ASSUME_NONNULL_BEGIN

@interface GameVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (nonatomic,strong) UIScrollView *sliderScrollView;
@property (weak, nonatomic) IBOutlet UIButton *videoplayButton;


-(void)ScrollViewImages:(NSArray *)imageArr Video:(NSArray *)videoArr;
@end

NS_ASSUME_NONNULL_END
