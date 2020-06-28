//
//  ToolsListViewController.m
//  Jump
//
//  Created by mac on 2020/6/29.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "ToolsListViewController.h"
#import "NetWorkObject.h"
@interface ToolsListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *toolList;
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ToolsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self fetchData];
}

-(void)fetchData{
    
    [NetWorkObject searchAllToolSuccess:^(id  _Nonnull success) {
        self.toolList = [success objectForKey:@"result"];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toolList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        NSDictionary *tempDic = self.toolList[indexPath.row];
        cell.textLabel.text =[tempDic objectForKey:@"cellName"];
        cell.detailTextLabel.text =[tempDic objectForKey:@"cellPic"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

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
