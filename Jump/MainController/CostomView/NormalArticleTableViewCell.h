//
//  NormalArticleTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/27.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NormalArticleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

NS_ASSUME_NONNULL_END
