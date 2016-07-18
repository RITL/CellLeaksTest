//
//  YBAreaCell.h
//  CityBao
//
//  Created by YueWen on 16/4/28.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YAreaModel;


/**
 *  平安校车-地区的cell
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface YBAreaCell : UITableViewCell


/**
 *  显示选中的图标
 */
- (void)showChooseSignImage;


/**
 *  显示未选中的图标
 */
- (void)showNormalSignImage;

@end







#pragma mark - 适配YAreaModel的类目
/**
 *  适配YAreaModel的类目
 */
@interface YBAreaCell (YAreaModel)


/**
 *  根据YAreaModel对象设置相关属性
 *
 *  @param area YAreaModel对象
 */
- (void)cellMessageWith:(YAreaModel *)area;



@end
