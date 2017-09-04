//
//  JSYHPayWayViewController.m
//  YYDineTogether
//
//  Created by 吴頔 on 17/9/1.
//  Copyright © 2017年 lichunfei. All rights reserved.
//

#import "JSYHPayWayViewController.h"
#import <AlipaySDK/AlipaySDK.h>

@interface JSYHPayWayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@end

@implementation JSYHPayWayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.priceLabel.text = self.price;
}
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)payAction:(id)sender {
    [[JSRequestManager sharedManager] payWithPaytype:@"2" Orderno:self.order_no Success:^(id responseObject) {
        NSString *schemes = @"JSZPeiApp";
        [[AlipaySDK defaultService] payOrder:responseObject[@"data"][@"prepayparam"] fromScheme:schemes callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            if ([resultDic[@"resultStatus"] isEqualToString:@"6001"]) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"JSZPpayResult" object:@"6001"];
                [AppManager showToastWithMsg:@"支付失败"];
                [[ShoppingCartManager sharedManager] cleanShoppingcart];
                [self.navigationController popToRootViewControllerAnimated:YES];
            } else {
                [AppManager showToastWithMsg:@"支付成功"];
                [[ShoppingCartManager sharedManager] cleanShoppingcart];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    } Failed:^(NSError *error) {
        
    }];
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
