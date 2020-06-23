//
//  mainCardView.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "MainCardView.h"
#import "Masonry.h"
#import "SDCycleScrollView.h"
#import "horizontalSlideButtonView.h"
#import "CardTableViewCell.h"
#import "NetWorkObject.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "GameDataModel.h"
#import "YYModel.h"
#import "GameDeatilViewController.h"
@interface MainCardView()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,HorizontalSlideButtonDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *gameListArr;
@property(nonatomic,strong)NSArray *topHorizonButtonArr;
@property(nonatomic,assign)BOOL onOff;
@property(nonatomic,strong)UIImageView *arrowImage;
@property(nonatomic,strong)UIButton *fullScreenButton;
@property(nonatomic,strong)horizontalSlideButtonView *switchItmeView;
@property(nonatomic,strong)horizontalSlideButtonView *areaSlidView;

//webType
@property(nonatomic,strong)NSMutableDictionary *screenTypeDic;

//mjrefresh
@property(nonatomic,assign)NSUInteger refreshPage;
@end


@implementation MainCardView


-(id)init{
    
    self = [super init];
   // self.backgroundColor = [UIColor redColor];
    return self;
}

-(void)drawVieWithType:(MainCardViewType)type{
    

    
    self.gameListArr = [NSMutableArray new];
    self.screenTypeDic = [NSMutableDictionary new];
    [self initScrach];
    self.onOff = YES;
    
    [self getUserData];
  

    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        makeEdges(self, 0, 5, 0, 0);
    }];
    
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefrshGeymoreData)];
    
    
    
    /*
    
    */
}

-(void)initScrach{
    self.refreshPage = 0;
    [self.screenTypeDic setValue:[NSString stringWithFormat:@"%lu",(unsigned long)self.refreshPage * 10] forKey:@"offset"];
     [self.screenTypeDic setValue:@"1" forKey:@"ifDiscount"];
     [self.screenTypeDic setValue:@"" forKey:@"title"];
     [self.screenTypeDic setValue:@"-1" forKey:@"orderByDiscountStart"];
     [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountEnd"];
     [self.screenTypeDic setValue:@"0" forKey:@"orderByCutoff"];
     [self.screenTypeDic setValue:@"0" forKey:@"orderByRate"];
     [self.screenTypeDic setValue:@"0" forKey:@"recommend"];
     [self.screenTypeDic setValue:@"featured" forKey:@"subCate"];
     [self.screenTypeDic setValue:@"index" forKey:@"hotType"];
}
-(void)searchTypeRemake{
    [self.screenTypeDic setValue:@"-1" forKey:@"orderByDiscountStart"];
    [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountEnd"];
    [self.screenTypeDic setValue:@"0" forKey:@"orderByCutoff"];
    [self.screenTypeDic setValue:@"0" forKey:@"orderByRate"];
}
-(void)footerRefrshGeymoreData{
    self.refreshPage ++;
    [self.screenTypeDic setValue:[NSString stringWithFormat:@"%lu",(unsigned long)self.refreshPage * 10] forKey:@"offset"];
    [self getGameListWithModelDic:self.screenTypeDic];
    [self.tableView.mj_footer endRefreshing];
    //self.backgroundColor = [UIColor grayColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID";
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"CardTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle =NO;
    if (self.gameListArr.count != 0) {
        //JsonDataModle *tempMode = [JsonDataModle arrayOfModelsFromDictionaries:self.gameModele.data.g[indexPath.row] error:nil];
        //tempMode.Game
        Games *gameModel = self.gameListArr[indexPath.row];
        [cell.gamePic sd_setImageWithURL:[NSURL URLWithString:gameModel.icon]];
        cell.gameTitle.text = gameModel.titleZh;
        cell.gameEnTitle.text = gameModel.title;
        if(gameModel.chineseVer == 1 && gameModel.lowestPrice != nil){
            cell.ChineseLabel.text = @" 全区中文 ";
            cell.ChineseLabel.textColor = [UIColor redColor];
            cell.lowestPriceLable.text = @" 史低 ";
            cell.lowestPriceLable.textColor = [UIColor blueColor];
        }
        if(gameModel.chineseVer == 0 && gameModel.lowestPrice != nil){
            cell.ChineseLabel.text = @" 史低 ";
            cell.ChineseLabel.textColor = [UIColor blueColor];
            cell.lowestPriceLable.hidden = YES;
        }
        if(gameModel.chineseVer == 0 && gameModel.lowestPrice != nil){
            cell.ChineseLabel.hidden = YES;
            cell.lowestPriceLable.hidden = YES;
        }
        if (gameModel.recommendLevel == -1) {
            //不推荐
            cell.RecommImageView1.hidden = YES;
            cell.RecommImageView2.hidden = YES;
            if (gameModel.rate == 0) {
                cell.GradeLabel.hidden = YES;
            }else{
                cell.GradeLabel.text = [NSString stringWithFormat:@"%ld",(long)gameModel.rate];
            }
            
        }else if (gameModel.recommendLevel == 0) {
            //一般
            if (gameModel.rate == 0) {
                cell.GradeLabel.hidden = YES;
                cell.RecommImageView1.hidden = YES;
                cell.RecommImageView2.transform = CGAffineTransformScale(cell.RecommImageView2.transform, 1.0, -1.0);
                cell.RecommImageView2.image = [UIImage imageNamed:@"icon_unrecomm.png"];
            }else{
                cell.RecommImageView2.hidden = YES;
                cell.GradeLabel.text = [NSString stringWithFormat:@"%ld",(long)gameModel.rate];
                cell.RecommImageView1.transform = CGAffineTransformScale(cell.RecommImageView2.transform, 1.0, -1.0);
                cell.RecommImageView1.image = [UIImage imageNamed:@"icon_unrecomm.png"];
            }
            
        }else{
            //推荐
            if (gameModel.rate == 0) {
                cell.GradeLabel.hidden = YES;
                cell.RecommImageView1.hidden = YES;
                cell.RecommImageView2.image = [UIImage imageNamed:@"icon_recomm.png"];
            }
            else{
                cell.RecommImageView2.highlighted = YES;
                cell.GradeLabel.text = [NSString stringWithFormat:@"%ld",(long)gameModel.rate];;
                cell.RecommImageView1.image = [UIImage imageNamed:@"icon_recomm.png"];
            }
            
        }
        
        
        NSString *priceStr = [NSString stringWithFormat:@"¥%.2f ¥%.2f (%@区)",gameModel.price,gameModel.priceRaw,gameModel.country];
        NSArray*separatedArray = [priceStr componentsSeparatedByString:@" "];
        NSMutableAttributedString *tempPriceStr = [[NSMutableAttributedString alloc]initWithString:priceStr];
        //NSLog(@"%@",tempPriceStr);
        //1段
        [tempPriceStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, [(NSString *)separatedArray[0] length])];
        [tempPriceStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, [(NSString *)separatedArray[0] length])];
        //2段
        [tempPriceStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange([(NSString *)separatedArray[0] length] + 1, [(NSString *)separatedArray[1] length])]; //添加下划线
        [tempPriceStr addAttribute:NSStrikethroughColorAttributeName value:[UIColor grayColor] range:NSMakeRange([(NSString *)separatedArray[0] length] + 1, [(NSString *)separatedArray[1] length])];
        //3段
        [cell.gamePrice setAttributedText:tempPriceStr];
        
        NSString *leftTempStr = [NSString stringWithFormat:@"%ld%%折扣\n剩余%@",(long)gameModel.cutoff,gameModel.leftDiscount];
        NSMutableAttributedString *templeftTempStr = [[NSMutableAttributedString alloc]initWithString:leftTempStr];
        [templeftTempStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, [NSString stringWithFormat:@"%ld%%折扣",gameModel.cutoff].length)];
       // [templeftTempStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:8] range:NSMakeRange([NSString stringWithFormat:@"%ld%%折扣",gameModel.cutoff].length, leftTempStr.length - 1)];
        [cell.surplusLable setAttributedText:templeftTempStr];
        
    }
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.gameListArr.count != 0) {
        return self.gameListArr.count;
    }else{
        return 1;
    }
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 152;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *headerID = @"headerId";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    //headerView.backgroundColor = [UIColor whiteColor];
    if (headerView == nil) {
        headerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:headerID];
        //headerView.backgroundView.backgroundColor = [UIColor whiteColor];
        self.cycleScrollView = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(5, 0, self.bounds.size.width - 20, 100)];
        [headerView addSubview:self.cycleScrollView];
        self.cycleScrollView.delegate = self;
        self.cycleScrollView.layer.cornerRadius = 4.0;
        self.cycleScrollView.layer.masksToBounds = YES;
        self.cycleScrollView.currentPageDotColor = [UIColor whiteColor];
        
        
        self.switchItmeView = [[horizontalSlideButtonView alloc]initWithFrame:CGRectMake(0, 100, self.bounds.size.width, 33)];
        [headerView addSubview:self.switchItmeView];
        self.switchItmeView.delegate = self;
        //switchItmeView.backgroundColor = [UIColor redColor];
        [self.switchItmeView numOfButtonWithArr:@[@"Switch",@"Steam"] horizontalSlideButtonType:HorizontalSlideButtonType2];
        UIButton *lotteryButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - 115, 105, 95, 23)];
        lotteryButton.backgroundColor = [UIColor redColor];
        lotteryButton.layer.cornerRadius = 12.5;
        lotteryButton.layer.masksToBounds = YES;
        [lotteryButton setTitle:@"正在抽奖" forState:UIControlStateNormal];
        [lotteryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        lotteryButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        [headerView addSubview:lotteryButton];
        
        
        
        self.areaSlidView = [[horizontalSlideButtonView alloc]initWithFrame:CGRectMake(5, 133, self.bounds.size.width, 19)];
        [headerView addSubview:self.areaSlidView];
        self.areaSlidView.delegate = self;
        [self.areaSlidView numOfButtonWithArr:@[@"精选",@"全部",@"美区",@"日区",@"港区",@"史低"] horizontalSlideButtonType:HorizontalSlideButtonType3];

    }

    headerView.contentView.backgroundColor = [UIColor whiteColor];
    return headerView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 152;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else if(scrollView.contentOffset.y >= sectionHeaderHeight){
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GameDeatilViewController  *controller = [[GameDeatilViewController alloc]init];
    Games *gameModel = self.gameListArr[indexPath.row];
    controller.title = gameModel.titleZh;
    controller.appid = gameModel.appid;
    self.controller.tabBarController.tabBar.hidden = YES;
    [self.controller.navigationController pushViewController:controller animated:YES];
    
}

-(void)getUserData{

    
 
    [self getGameListWithModelDic:self.screenTypeDic];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [NetWorkObject bannerListSuccess:^(id  _Nonnull success) {
            //NSLog(@"%@",success);
            NSMutableArray *imageAddArr =[NSMutableArray new];
            for (NSDictionary*tempDic in [[success objectForKey:@"data"] objectForKey:@"banner"]) {
                [imageAddArr addObject: [tempDic objectForKey:@"pic"]];
            }
            //NSLog(@"---%@",imageAddArr);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.cycleScrollView.imageURLStringsGroup = imageAddArr;
            });
        } failure:^(id  _Nonnull failure) {
            NSLog(@"failure");
        }];
    });
}

-(void)getGameListWithModelDic:(NSMutableDictionary *)ModeleDic{
    
    [NetWorkObject GameWithSearchType: ModeleDic Success:^(id  _Nonnull success) {
        GameDataModel *gameDataModel = [GameDataModel yy_modelWithJSON:success];
        for (Games *tempmodel in gameDataModel.data.games) {
            [self.gameListArr addObject:tempmodel];
        }
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}
-(void)siderViewButtonClick:(NSInteger )buttonIndex HorizontalSlideButtonView:(id)viwe{
    
    
    if(viwe == self.switchItmeView){
        
    }else if(viwe == self.areaSlidView){
        
        if (buttonIndex == 0) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"featured" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        } else if (buttonIndex == 1) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"default" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        } else if (buttonIndex == 2) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"american" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        }
        else if (buttonIndex == 3) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"japan" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        }else if (buttonIndex == 4) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"hongkong" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        }
        else if (buttonIndex == 5) {
            [self.gameListArr removeAllObjects];
            [self.screenTypeDic setValue:@"lowest" forKey:@"subCate"];
            [self getGameListWithModelDic:self.screenTypeDic];
        }

    }

    
    
}

-(void)FullScreenDiscountTypeView{
    if (self.fullScreenButton!= nil) {
        [self closeOpenFullView];
        return;
    }
    NSArray *discountArr = @[@"最新折扣",@"剩余时间",@"折扣力度",@"评分最高",@"热度最高"];
    self.fullScreenButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
    [[UIApplication sharedApplication].keyWindow addSubview:self.fullScreenButton];
    [self.fullScreenButton addTarget:self action:@selector(fullScrllorButton:) forControlEvents:UIControlEventTouchUpInside];
    self.fullScreenButton.backgroundColor = [UIColor grayColor];
    self.fullScreenButton.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.7f];
    

    
    UIView *bgbiew = [[UIView alloc]init];
    [self.fullScreenButton addSubview:bgbiew];
    bgbiew.backgroundColor = [UIColor whiteColor];
    bgbiew.layer.cornerRadius = 4.0f;
    bgbiew.layer.masksToBounds = YES;
    [bgbiew mas_makeConstraints:^(MASConstraintMaker *make) {
        makeLeft(self.fullScreenButton.mas_left, 20);
        makeWidth(130);
        makeHeight(discountArr.count * 50 + 20);
        makeTop(self.fullScreenButton.mas_top, NaviTopBarHeight + 44);
    }];
    
    UIView *arrowView = [[UIView alloc]init];
    [self.fullScreenButton addSubview:arrowView];
    arrowView.backgroundColor = [UIColor whiteColor];
    [arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bgbiew.mas_centerX);
        makeWidth(10);
        makeHeight(10);
        makeBottom(bgbiew.mas_top, 5);
    }];
    arrowView.transform = CGAffineTransformRotate(arrowView.transform, M_PI_4);
    
    self.arrowImage  = [[UIImageView alloc]init];
    [bgbiew addSubview:self.arrowImage];
    self.arrowImage.backgroundColor = [UIColor redColor];

    
    for (int i = 0; i < discountArr.count; i ++) {
        UIButton *button = [[UIButton alloc]init];
        [bgbiew addSubview:button];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:discountArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            makeLeft(bgbiew.mas_left, 20);
            makeWidth(70);
            makeHeight(40);
            makeTop(bgbiew.mas_top, 10 + 50 * i);
        }];
        button.tag = 2000 + i;
        [button addTarget:self action:@selector(discountTypeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
                makeLeft(self.mas_left, 35);
                makeWidth(10);
                makeHeight(10);
                make.centerY.mas_equalTo(button.mas_centerY);
            }];
        }
    }
    
}

-(void)discountTypeButtonClick:(UIButton *)sender{
    
    [self.arrowImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        makeLeft(self.mas_left, 35);
        makeWidth(10);
        makeHeight(10);
        make.centerY.mas_equalTo(sender.mas_centerY);
    }];
    UIButton *button = (UIButton *)[self viewWithTag:1000];
    [button setTitle:[sender.titleLabel.text stringByAppendingString:@"▼"] forState:UIControlStateNormal];
    if (sender.tag == 2000) {
        [self.gameListArr removeAllObjects];
        [self searchTypeRemake];
        [self getGameListWithModelDic:self.screenTypeDic];
    }else if (sender.tag == 2001){
        [self.gameListArr removeAllObjects];
        [self searchTypeRemake];
        [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountStart"];
        [self.screenTypeDic setValue:@"1" forKey:@"orderByDiscountEnd"];
        [self getGameListWithModelDic:self.screenTypeDic];
    }else if (sender.tag == 2002){
        [self.gameListArr removeAllObjects];
        [self searchTypeRemake];
        [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountStart"];
        [self.screenTypeDic setValue:@"-1" forKey:@"orderByCutoff"];
        [self getGameListWithModelDic:self.screenTypeDic];
    }else if (sender.tag == 2003){
        [self.gameListArr removeAllObjects];
        [self searchTypeRemake];
        [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountStart"];
        [self.screenTypeDic setValue:@"-1" forKey:@"orderByRate"];
        [self getGameListWithModelDic:self.screenTypeDic];
    }else if (sender.tag == 2004){
        [self.gameListArr removeAllObjects];
        [self searchTypeRemake];
        [self.screenTypeDic setValue:@"0" forKey:@"orderByDiscountStart"];
        [self.screenTypeDic setValue:@"0" forKey:@"orderByRate"];
        [self getGameListWithModelDic:self.screenTypeDic];
    }
    [self closeOpenFullView];
}

-(void)fullScrllorButton:(UIButton *)sender{
    
    [self closeOpenFullView];

    
}

-(void)closeOpenFullView{
    
    if (self.onOff == YES) {
        self.fullScreenButton.hidden = YES;
        self.onOff = NO;
    }else{
        self.fullScreenButton.hidden = NO;
        self.onOff = YES;
        
    }

}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}


@end
