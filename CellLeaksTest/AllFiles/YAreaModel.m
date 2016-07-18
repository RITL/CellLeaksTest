//
//  YAreaModel.m
//  CityBao
//
//  Created by YueWen on 16/3/25.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "YAreaModel.h"

@implementation YAreaModel


-(instancetype)initWithArea:(NSString *)area areaNumber:(NSString *)areaNumber
{
    if (self = [super init])
    {
        self.area = area;
        self.areaNumber = areaNumber;
    }
    
    return self;
}


+(instancetype)areaWithArea:(NSString *)area areaNumber:(NSString *)areaNumber
{
    YAreaModel * areaModel = [[YAreaModel alloc]initWithArea:area areaNumber:areaNumber];
    
    return areaModel;
}

@end







@interface YAreaModelManager()

@property (nonatomic, copy)NSArray * areas;

@end


@implementation YAreaModelManager


+(instancetype)shareInstance
{
    static YAreaModelManager * areaMananger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        areaMananger = [[YAreaModelManager alloc]init];
        
    });
    
    return areaMananger;
}


-(BOOL)willDealloc
{
    return false;
}

-(NSArray *)areas
{
    if(_areas == nil)
    {
        YAreaModel * model0  = [YAreaModel areaWithArea:@"潍坊市" areaNumber:@"370700"];
        YAreaModel * model1  = [YAreaModel areaWithArea:@"潍城区" areaNumber:@"370702"];
        YAreaModel * model2  = [YAreaModel areaWithArea:@"奎文区" areaNumber:@"370705"];
        YAreaModel * model3  = [YAreaModel areaWithArea:@"高新区" areaNumber:@"370707"];
        YAreaModel * model4  = [YAreaModel areaWithArea:@"安丘市" areaNumber:@"370784"];
        YAreaModel * model5  = [YAreaModel areaWithArea:@"寿光市" areaNumber:@"370783"];
        YAreaModel * model6  = [YAreaModel areaWithArea:@"青州市" areaNumber:@"370781"];
        YAreaModel * model7  = [YAreaModel areaWithArea:@"诸城市" areaNumber:@"370782"];
        YAreaModel * model8  = [YAreaModel areaWithArea:@"昌邑市" areaNumber:@"370786"];
        YAreaModel * model9  = [YAreaModel areaWithArea:@"昌乐县" areaNumber:@"370725"];
        YAreaModel * model10 = [YAreaModel areaWithArea:@"临朐县" areaNumber:@"370724"];
        YAreaModel * model11 = [YAreaModel areaWithArea:@"坊子区" areaNumber:@"370704"];
        YAreaModel * model12 = [YAreaModel areaWithArea:@"寒亭区" areaNumber:@"370703"];
        YAreaModel * model13 = [YAreaModel areaWithArea:@"高密市" areaNumber:@"370785"];
        
        _areas = [NSArray arrayWithObjects:model0,model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11,model12,model13, nil];
    }
    
    return _areas;
}



+ (NSArray <YAreaModel *> *)areaLoadDistributionArea
{
    return [YAreaModelManager shareInstance].areas;
}



#pragma mark - 根据地区编号获取地区名称
+(YAreaModel *)areaWithNumber:(NSString *)areaNumber
{
    if (areaNumber == nil)
        return nil;
    
    for (YAreaModel * areaModel in [YAreaModelManager shareInstance].areas)
    {
        if ([areaModel.areaNumber isEqualToString:areaNumber])
        {
            return areaModel;
        }
    }
    
    return nil;
}



#pragma mark - 根据地区名称获取地区编号
+(YAreaModel *)areaWithName:(NSString *)areaName
{
    if (areaName == nil)
        return nil;
    
    for (YAreaModel * areaModel in [YAreaModelManager shareInstance].areas)
    {
        if ([areaModel.area isEqualToString:areaName])
        {
            return areaModel;
        }
    }
    
    return nil;
}

@end
