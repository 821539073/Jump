//
//  ToolsListViewController.m
//  Jump
//
//  Created by mac on 2020/6/29.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "ToolsListViewController.h"
#import "NetWorkObject.h"
#import "ToolsListTableViewCell.h"
#import "CollocateViewController.h"
@interface ToolsListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *toolList;
@property(nonatomic,strong)NSArray *optionList;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ToolsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.toolList = [NSMutableArray new];
    self.optionList = @[@"添加小工具",@"删除全部"];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //[self fetchData];
}

-(void)viewWillAppear:(BOOL)animated{
    [self fetchData];
}

-(void)fetchData{
    
    [NetWorkObject searchAllToolSuccess:^(id  _Nonnull success) {
        [self.toolList removeAllObjects];
        [self.toolList addObjectsFromArray:[success objectForKey:@"result"]];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.toolList.count;
    }else{
        return self.optionList.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellID0";
    ToolsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"ToolsListTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    if (indexPath.section == 0) {
        [cell cellStyle1];
        NSDictionary *tempDic = self.toolList[indexPath.row];
        cell.cellNameLabel.text = [tempDic objectForKey:@"cellName"];
        cell.cellPicLabel.text = [tempDic objectForKey:@"cellPic"];
    }else if(indexPath.section == 1){
        [cell cellStyle2];
        NSString *tempStr = self.optionList[indexPath.row];
        cell.optionLabel.text = tempStr;
        if([tempStr isEqualToString:@"删除全部"]){
            cell.optionLabel.backgroundColor = [UIColor redColor];
        }
    }
    return cell;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return YES;
    }
    return NO;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tempDic = self.toolList[indexPath.row];
    [NetWorkObject removeToolWithName:[tempDic objectForKey:@"cellName"] Success:^(id  _Nonnull success) {
        NSLog(@"%@",success);
        [self.toolList removeAllObjects];
        [self.toolList addObjectsFromArray:[success objectForKey:@"result"]];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *tempStr = self.optionList[indexPath.row];
    if([tempStr isEqualToString:@"添加小工具"]){
        CollocateViewController *v1 = [[CollocateViewController alloc]init];
        v1.title = tempStr;
        [self.navigationController pushViewController:v1 animated:YES];
    }else if([tempStr isEqualToString:@"删除全部"]){
        [NetWorkObject removeAllToolSuccess:^(id  _Nonnull success) {
            NSLog(@"%@",success);
            [self.toolList removeAllObjects];
            [self.tableView reloadData];
        } failure:^(id  _Nonnull failure) {
            
        }];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
