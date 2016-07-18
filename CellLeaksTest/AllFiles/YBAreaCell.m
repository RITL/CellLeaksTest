//
//  YBAreaCell.m
//  CityBao
//
//  Created by YueWen on 16/4/28.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "YBAreaCell.h"
#import "YAreaModel.h"

@interface YBAreaCell()

@property (nonatomic, strong)UIImageView * chooseImageView;             //选中的图标显示

@end

@implementation YBAreaCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self loadYBAreaCell];
    }
    
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self loadYBAreaCell];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark- LoadCell
/**
 *  加载cell相关数据
 */
- (void)loadYBAreaCell
{
    [self addSubview:self.chooseImageView];
    
    //开始布局
    [self startAutoLayoutViews];
}


#pragma mark - Getter Function

/**
 *  选中图标显示框
 */
-(UIImageView *)chooseImageView
{
    if (_chooseImageView == nil)
    {
        _chooseImageView = [[UIImageView alloc]init];
        _chooseImageView.translatesAutoresizingMaskIntoConstraints = false;
        //YBDeselect dechoose
        _chooseImageView.image = [UIImage imageFileNamed:@"YBDeselect"];
    }
    
    return _chooseImageView;
}


#pragma mark - AutoLayout

/**
 *  开始约束布局
 */
- (void)startAutoLayoutViews
{
    //水平
    NSArray * hor1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_chooseImageView(20)]-5-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_chooseImageView)];
    [self addConstraints:hor1];
    
    //垂直
    NSArray * ver1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_chooseImageView(20)]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_chooseImageView)];
    
    //进行垂直居中
    NSLayoutConstraint * center = [NSLayoutConstraint constraintWithItem:_chooseImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self addConstraints:ver1];
    [self addConstraint:center];
}



-(void)showChooseSignImage
{
    //YBSelect didChoose
    self.chooseImageView.image = [UIImage imageFileNamed:@"YBSelect"];
}

-(void)showNormalSignImage
{
    //YBDeselect dechoose
    self.chooseImageView.image = [UIImage imageFileNamed:@"YBDeselect"];
}

-(void)dealloc
{
    NSLog(@"areaCell dealloc");
}

//-(BOOL)willDealloc
//{
//    return false;
//}

@end




@implementation YBAreaCell (YAreaModel)


-(void)cellMessageWith:(YAreaModel *)area
{
    self.textLabel.text = area.area;
}

@end
