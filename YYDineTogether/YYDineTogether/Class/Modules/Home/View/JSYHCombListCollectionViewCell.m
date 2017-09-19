//
//  JSYHCombListCollectionViewCell.m
//  YYDineTogether
//
//  Created by 吴頔 on 17/9/15.
//  Copyright © 2017年 lichunfei. All rights reserved.
//

#import "JSYHCombListCollectionViewCell.h"
#import "JSYHDishModel.h"

@interface JSYHCombListCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;
@property (weak, nonatomic) IBOutlet UILabel *dishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dishPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation JSYHCombListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDishModel:(JSYHDishModel *)dishModel {
    _dishModel = dishModel;
    [self.dishImageView setImageWithURL:[NSURL URLWithString:_dishModel.logo] placeholder:nil];
    self.dishNameLabel.text = _dishModel.name;
    self.dishPriceLabel.text = [NSString stringWithFormat:@"¥ %@",_dishModel.price];
}

@end