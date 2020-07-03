//
//  GradeTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/16.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *GradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

NS_ASSUME_NONNULL_END
