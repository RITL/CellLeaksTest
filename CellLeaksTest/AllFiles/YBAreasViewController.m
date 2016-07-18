//
//  YBAreasViewController.m
//  CityBao
//
//  Created by YueWen on 16/4/28.
//  Copyright © 2016年 wangpj. All rights reserved.
//

#import "YBAreasViewController.h"
#import "YAreaModel.h"
#import "YBAreaCell.h"

@interface YBAreasViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy)NSArray <YAreaModel *> * areas;  //存放地区属性的数组
@property (nonatomic, strong)UITableView * tableView;       //展示的列表
@property (nonatomic, strong)YAreaModel * currentArea;      //保存当前位置对象

@property (nonatomic, copy)YBAreaDidChooseBlock areaSelectedBlock;//选择完毕后的回调


@end

@implementation YBAreasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indicateTitle = @"地区选择";
    [UINavigationItem setBackButtonOn:self target:self callbackSelector:@selector(back)];
    
    //添加tableView
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UITableView Delegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获得当前cell对象
    YBAreaCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //获得初始位置
    NSInteger index = [self.areas indexOfObject:self.currentArea];
    
    //初始化数据
    self.currentArea = self.areas[indexPath.row];
    
    //刷新当前index,row
    [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    //显示
    [cell showChooseSignImage];
    
    //进行地区回调
    if (self.areaSelectedBlock)
    {
        self.areaSelectedBlock(self.currentArea);
    }
    
    //跳回
    [self.navigationController popViewControllerAnimated:true];
}



#pragma mark - <UITableView Data Source>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.areas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取Model
    YAreaModel * area = self.areas[indexPath.row];
    
    //初始化cell
    YBAreaCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([area class]) forIndexPath:indexPath];
    
    //赋值
    [cell cellMessageWith:area];
    
    //进行地区标示
    if ([self.currentArea.areaNumber isEqualToString:area.areaNumber])
        [cell showChooseSignImage];
    
    else
        [cell showNormalSignImage];
    
    return cell;
}



#pragma mark - Getter Function
/**
 *  存放地区对象的数组
 */
-(NSArray<YAreaModel *> *)areas
{
    if (_areas == nil)
    {
        _areas = [YAreaModelManager areaLoadDistributionArea];
        
        //将“潍坊市”替换成"全部"
        _areas.firstObject.area = @"全部";
    }
    
    return _areas;
}


/**
 *  展示列表
 */
-(UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.showsVerticalScrollIndicator = false;
        [_tableView registerClass:[YBAreaCell class] forCellReuseIdentifier:NSStringFromClass([YAreaModel class])];
    }
    
    return _tableView;
}



/**
 *  当前位置的对象
 */
-(YAreaModel *)currentArea
{
   if(_currentArea == nil)//默认为当前首页位置
   {
       _currentArea = [YAreaModelManager areaWithNumber:[[NSUserDefaults standardUserDefaults] valueForKey:@"pos"]];
   }
    
    return _currentArea;
}


#pragma mark - Block
//设置回调
-(void)areaDidSelectedHandle:(YBAreaDidChooseBlock)areaDidSelectedBlockHandle
{
    self.areaSelectedBlock = areaDidSelectedBlockHandle;
}

@end
