//
//  YBAreasViewController.h
//  CityBao
//
//  Created by YueWen on 16/4/28.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YAreaModel;

/**
 *  地区选择的回调
 *
 *  @param area 返回的area对象
 */
typedef void(^YBAreaDidChooseBlock)(YAreaModel * area);



/**
 *  平安校车-选择地区的控制器
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface YBAreasViewController : UIViewController



/**
 *  地区选择完毕进行的回调
 *
 *  @param areaDidSelectedBlockHandle 选择完毕的回调
 */
- (void)areaDidSelectedHandle:(YBAreaDidChooseBlock)areaDidSelectedBlockHandle NS_AVAILABLE_IOS(7_0);





@end
