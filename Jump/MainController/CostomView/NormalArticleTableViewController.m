//
//  NormalArticleTableViewController.m
//  Jump
//
//  Created by mac on 2020/6/27.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "NormalArticleTableViewController.h"
#import "NetWorkObject.h"
#import "NormalArticleModel.h"
#import "YYModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NormalArticleTableViewCell.h"
@interface NormalArticleTableViewController ()
@property(nonatomic,strong) NSArray *contentList;
@property(nonatomic,strong) NSString *articleTitle;
//@property(nonatomic,strong) NSMutableArray *cellHeightArr;
@end

@implementation NormalArticleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (self.articleId != nil) {
        
        [self getNormalArticle];
        
    }
   
}

-(void)getNormalArticle{
    [NetWorkObject getNormalArticleWithId:self.articleId Success:^(id  _Nonnull success) {
        NormalArticleModel *model = [NormalArticleModel yy_modelWithJSON:success];
        self.contentList = [NSArray arrayWithArray:model.data.contentList];
        self.articleTitle = model.data.name;
        [self.tableView reloadData];
    } failure:^(id  _Nonnull failure) {
        
    }];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, DeviceWidth - 12, 44)];
    [view addSubview:label];
    label.text = self.articleTitle;
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Contentlist *list = self.contentList[indexPath.row];
    if ([list.type isEqualToString:@"text"] ) {
        return [self cellHeight:list.text];
    }else if([list.type isEqualToString:@"image"]){
        return (DeviceWidth - 12)*0.5625;
    }
    return 44;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 44;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else if(scrollView.contentOffset.y >= sectionHeaderHeight){
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID0";
    NormalArticleTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"NormalArticleTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        Contentlist *list = self.contentList[indexPath.row];
        if ([list.type isEqualToString:@"text"]) {
            //ce.hidden = YES;
            cell.bgImageView.hidden = YES;
            cell.textView.hidden = NO;
            cell.textView.text = list.text;
        }else if([list.type isEqualToString:@"image"]){
            cell.textView.hidden = YES;
            cell.bgImageView.hidden = NO;
            [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:list.image]];

            
        }
    }
    return cell;
}

-(float)cellHeight:(NSString *)test{
    
    UITextView *textView = [[UITextView alloc]init];
    textView.font = [UIFont systemFontOfSize:14];
    textView.text = test;
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(DeviceWidth - 12, MAXFLOAT)];
    //NSLog(@"H:%f,W:%f,DeviceWidth:%f",sizeToFit.height,sizeToFit.width,DeviceWidth - 10);
    return sizeToFit.height;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
