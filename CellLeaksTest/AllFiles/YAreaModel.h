//
//  YAreaModel.h
//  CityBao
//
//  Created by YueWen on 16/3/25.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import <Foundation/Foundation.h>




/**
 *  存储地区名称以及编号的DTO
 */
NS_CLASS_AVAILABLE_IOS(7_0) @interface YAreaModel : NSObject

/**
 *  地区名称
 */
@property(nonatomic,copy)NSString * area;
/**
 *  地区编号
 */
@property(nonatomic,copy)NSString * areaNumber;


/**
 *  便利初始化方法
 *
 *  @param area       地区名称
 *  @param areaNumber 地区编号
 *
 *  @return 创建好的YAreaModel对象
 */
-(instancetype)initWithArea:(NSString*)area areaNumber:(NSString*)areaNumber;



/**
 *  便利构造器
 */
+ (instancetype)areaWithArea:(NSString *)area areaNumber:(NSString *)areaNumber;



@end



/**
 *  地区的管理者
 */
NS_AVAILABLE_IOS(7_0) @interface YAreaModelManager : NSObject

/**
 *  已经加载的县市区
 *
 *  @return 存放YAreaModel的数组
 */
+ (NSArray <YAreaModel *> * )areaLoadDistributionArea;



/**
 *  根据地区编号获取地区对象
 *
 *  @param areaNumber 地区编号
 *
 *  @return 地区对象,不存在返回nil
 */
+ (YAreaModel *)areaWithNumber:(NSString *)areaNumber;





/**
 *  根据地区名称获取地区对象
 *
 *  @param areaName 地区名称
 *
 *  @return 地区对象，不存在返回nil
 */
+ (YAreaModel *)areaWithName:(NSString *)areaName;




@end


