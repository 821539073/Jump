//
//  FindGameViewController.m
//  Jump
//
//  Created by mac on 2020/6/12.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "FindGameViewController.h"
#import "horizontalSlideButtonView.h"
#import "CollocateViewController.h"
#import "Masonry.h"
#import "ToolsListViewController.h"
#import "NetWorkObject.h"
@interface FindGameViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *listarr;
@end

@implementation FindGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. *h
    self.listarr = @[@"查看小工具",@"添加小工具",@"删除全部"];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listarr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.textLabel.text = self.listarr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *tempStr =  self.listarr[indexPath.row];
    if ([tempStr isEqualToString:@"查看小工具"]) {
        ToolsListViewController *v1 = [[ToolsListViewController alloc]init];
        v1.title = tempStr;
        [self.navigationController pushViewController:v1 animated:YES];
    }else if([tempStr isEqualToString:@"添加小工具"]){
        CollocateViewController *v1 = [[CollocateViewController alloc]init];
        v1.title = tempStr;
        [self.navigationController pushViewController:v1 animated:YES];
    }else if([tempStr isEqualToString:@"删除全部"]){
        [NetWorkObject removeAllToolSuccess:^(id  _Nonnull success) {
            NSLog(@"%@",success);
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
