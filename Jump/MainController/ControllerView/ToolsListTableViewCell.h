//
//  ToolsListTableViewCell.h
//  Jump
//
//  Created by mac on 2020/6/29.
//  Copyright © 2020 autorun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolsListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellPicLabel;

@property (weak, nonatomic) IBOutlet UILabel *optionLabel;
@property (weak, nonatomic) IBOutlet UILabel *line;


-(void)cellStyle1;
-(void)cellStyle2;

@end

NS_ASSUME_NONNULL_END
