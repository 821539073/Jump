//
//  TodayRecommendView.m
//  Jump
//
//  Created by mac on 2020/6/20.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "TodayRecommendView.h"
#import "Masonry.h"
#import "TodayRecommendTableViewCell.h"
#import "NetWorkObject.h"
#import "MJRefresh.h"
#import "TodayRecomModel.h"
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface TodayRecommendView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *gameListArr;
@end

@implementation TodayRecommendView


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    //self.backgroundColor = [UIColor redColor];
    
    self.gameListArr = [NSMutableArray new];
    
    if (!self.tableView) {
        [self drawView];
        [self fetchData];
    }
    return self;
}

-(void)fetchData{
    [NetWorkObject TodayGameRecommendoffset:@"0" Success:^(id  _Nonnull success) {
        TodayRecomModel *model = [TodayRecomModel yy_modelWithJSON:success];
        [self.gameListArr addObjectsFromArray:model.data.information_flow];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}

-(void)drawView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor redColor];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(fetchData)];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180 + 44;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.gameListArr.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellID0";
    TodayRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"TodayRecommendTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        InformationFlow *information =self.gameListArr[indexPath.row];
        
        [cell.gamePic sd_setImageWithURL:[NSURL URLWithString:information.pic]];
        cell.gameTitle.text = information.gameTitleZh;
        cell.recommendTitle.text = information.content;
        [cell.userProfilePic sd_setImageWithURL:[NSURL URLWithString:information.avatarUrl]];
        cell.usename.text = information.nickName;
        //tableView.separatorStyle =NO;
        
        
    }
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
