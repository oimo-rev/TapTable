//
//  SelectViewController.m
//  TapTable
//
//  Created by 図師ともみ on 2015/12/02.
//  Copyright © 2015年 FBC. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()
    <UITableViewDelegate, UITableViewDataSource>
@end
/////////////////////////////////
@implementation SelectViewController
//tableviewの編集

//header 何回繰り返す？
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 4 ;}

//header 何を編集する？
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section) {
        case 0:return @"section1 (๑•́‧̫•̀๑)"; break;
        case 1:return @"section2 (๑•́‧̫•̀๑)"; break;
        case 2:return @"section3 (๑•́‧̫•̀๑)"; break;
        default:return @"comments (๑•́‧̫•̀๑)"; break;
    }
}
//cell 何回繰り返す？
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return 2 ;}

//cell 何を編集する？
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"この先に道はないっ！";
    cell.contentView.backgroundColor = [UIColor grayColor];
    return cell;
}
//タップされた時のeventは？
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction) tapBackBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
