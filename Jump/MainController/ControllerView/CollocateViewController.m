//
//  CollocateViewController.m
//  Jump
//
//  Created by mac on 2020/6/28.
//  Copyright © 2020 autorun. All rights reserved.
//

#import "CollocateViewController.h"
#import "NetWorkObject.h"
@interface CollocateViewController ()
@property(nonatomic,strong)NSMutableDictionary *toolDic;
@end

@implementation CollocateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.toolDic = [NSMutableDictionary new];
}
- (IBAction)toolNameTextField:(id)sender {
    
    
}
- (IBAction)toolPicTextField:(id)sender {
    
    
}
- (IBAction)addButtonCilck:(id)sender {
    [self.toolPicTextFiled resignFirstResponder];
    [self.toolNameTextFiled resignFirstResponder];
    if (self.toolNameTextFiled.text.length == 0&&self.toolPicTextFiled.text.length) {
        return;
    }

    [self.toolDic setValue:self.toolNameTextFiled.text forKey:@"cellName"];
    [self.toolDic setValue:self.toolPicTextFiled.text forKey:@"cellPic"];
    
    [self fetchData];

}

-(void)fetchData{
    
    [NetWorkObject addToolWithDic:self.toolDic Success:^(id  _Nonnull success) {
        NSLog(@"%@",success);
    } failure:^(id  _Nonnull failure) {
        
    }];
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
