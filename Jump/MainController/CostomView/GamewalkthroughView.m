//
//  GamewalkthroughView.m
//  Jump
//
//  Created by mac on 2020/6/20.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "GamewalkthroughView.h"
#import "Masonry.h"
#import "GamewalkthroughtCollectionViewCell.h"
#import "NetWorkObject.h"
#import "GonglveModel.h"
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GameHeaderCollectionView.h"
@interface GamewalkthroughView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic,strong)  NSArray *gonglveArr;
@property (nonatomic,strong)  NSArray *headeTitleArr;
@property (nonatomic,strong)  NSArray *toolsArr;
@end

@implementation GamewalkthroughView


-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (!self.collectionView) {
        [self drawView];
        [self fetchData];
    }
    return self;
}

-(void)drawView{
    
    self.headeTitleArr = @[@"小工具",@"收藏的攻略",@"全部攻略",@"新手必读"];
    self.toolsArr = @[@"Switch相册同步",@"大头菜交易",@"大头菜理财"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.itemSize = CGSizeMake((DeviceWidth - 5)/4, (DeviceWidth - 5)/4);
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];

    [self.collectionView registerNib:[UINib nibWithNibName:@"GamewalkthroughtCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GamewalkthroughtCollectionViewCell"];
    [self.collectionView registerClass:[GameHeaderCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
     //使用原有重用视图
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootView"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}
-(void)fetchData{
    [NetWorkObject getAllGonglveSuccess:^(id  _Nonnull success) {
        GonglveModel *gonglve = [GonglveModel yy_modelWithJSON:success];
        self.gonglveArr = [NSArray arrayWithArray:gonglve.data.allGonglveList];
        [self.collectionView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}
#pragma mark collectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.toolsArr.count;
    }else if (section == 1) {
        return 1;
    }if (section == 2) {
        return self.gonglveArr.count;
    }
     return 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GamewalkthroughtCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GamewalkthroughtCollectionViewCell" forIndexPath:indexPath];
    //[cell sizeToFit];
    cell.backgroundColor = [UIColor whiteColor];
    if(indexPath.section == 0){
        cell.nameLabel.text = self.toolsArr[indexPath.row];
    }else if(indexPath.section == 1){
        cell.nameLabel.text = @"222" ;
    }else if(indexPath.section == 2){
        Allgonglvelist *model = self.gonglveArr[indexPath.row];
        cell.nameLabel.text = model.title;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    }

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(DeviceWidth, 44);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
     UICollectionReusableView *reusableview = nil;

     if (kind == UICollectionElementKindSectionHeader) {

       GameHeaderCollectionView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
         for(UIView *v in headerView.subviews) {
              [v removeFromSuperview];
          }
         [headerView setHeaderTitle:self.headeTitleArr[indexPath.section]];
       reusableview = headerView;
     }
    
     if (kind == UICollectionElementKindSectionFooter) {
    
       UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootView" forIndexPath:indexPath];
       /**
        *  如果头尾视图没什么很多内容,直接创建对应控件进行添加即可,无需自定义.
        */
       footerview.backgroundColor=[UIColor redColor];
       reusableview = footerview;
     }
    
     return reusableview;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
