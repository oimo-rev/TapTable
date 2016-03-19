//
//  MenuViewController.m
//  TapTable
//
/////////////////////////////////////////////////
#import "MenuViewController.h"
#import "SelectViewController.h"

@interface MenuViewController ()
    <UITableViewDelegate, UITableViewDataSource>
@end
/////////////////////////////////////////////////
@implementation MenuViewController
//tableviewの編集

//header 何回繰り返す？
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 4 ;}

//header 何を編集する？
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch(section) {
        case 0:return @"section1 ٩(•౪• ٩)"; break;
        case 1:return @"section2 ٩(•౪• ٩)"; break;
        case 2:return @"section3 ٩(•౪• ٩)"; break;
        default:return @"comments ٩(•౪• ٩)"; break;
    }
}
//cell 何回繰り返す？
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//cell 何を編集する？
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
    (NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"騙されたと思ってタップっ！";
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}
//タップされた時のeventは？
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //処理
    [self Alert];
    //選択状態の解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(void)Alert{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"次の画面に遷移しますか？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action){
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"はい"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction*action){
        SelectViewController *VC;
        VC = [[SelectViewController alloc]initWithNibName:@"SelectViewController" bundle:nil];
        [self presentViewController:VC animated:NO completion:nil];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
    
    
}


/////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
@end
