//
//  HomeStoreViewController.m
//  YYDineTogether
//
//  Created by 吴頔 on 17/6/11.
//  Copyright © 2017年 lichunfei. All rights reserved.
//

#import "HomeStoreViewController.h"
#import "HomeStoreRightTableViewCell.h"
#import "HomeStoreDetailViewController.h"
#import "HomeFoodDetailViewController.h"

@interface HomeStoreViewController ()<UITableViewDelegate, UITableViewDataSource>{
    BOOL _isCombo;
}
@property (weak, nonatomic) IBOutlet UIButton *foodButton;
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UIButton *comboButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineLeading;


@end

@implementation HomeStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self registUI];
}

- (void)registUI {
    _isCombo = NO;
    [self.leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeStoreLeftTableViewCell"];
    [self.rightTableView registerNib:[UINib nibWithNibName:@"HomeStoreRightTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeStoreRightTableViewCell"];
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)flowAction:(id)sender {
    
}

- (IBAction)foodAction:(id)sender {
    if (_isCombo) {
        [_foodButton setTitleColor:RGB(219, 83, 64) forState:(UIControlStateNormal)];
        [_comboButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _isCombo = NO;
        self.bottomLineLeading.constant = 0;
    }
}

- (IBAction)comboAction:(id)sender {
    if (!_isCombo) {
        [_comboButton setTitleColor:RGB(219, 83, 64) forState:(UIControlStateNormal)];
        [_foodButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _isCombo = YES;
        self.bottomLineLeading.constant = KScreenWidth / 2;
    }
}

- (IBAction)storeDetailAction:(id)sender {
    HomeStoreDetailViewController *detailVC = [[HomeStoreDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        return 30;
    } else {
        return 110;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeStoreLeftTableViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.text = @"荤菜";
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    } else {
        HomeStoreRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeStoreRightTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _rightTableView) {
        HomeFoodDetailViewController *foodDetailVC = [[HomeFoodDetailViewController alloc] init];
        [self.navigationController pushViewController:foodDetailVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
