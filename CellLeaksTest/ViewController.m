//
//  ViewController.m
//  CellLeaksTest
//
//  Created by YueWen on 16/7/18.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import "ViewController.h"
#import "YBAreasViewController.h"
#import "YAreaModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置默认值
    [[NSUserDefaults standardUserDefaults]setValue:@"370702" forKey:@"pos"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonDidTap:(id)sender
{
    YBAreasViewController * viewController = [[YBAreasViewController alloc]init];
    
    
    [viewController areaDidSelectedHandle:^(YAreaModel *area) {
       
        NSLog(@"area = %@",area);
        
    }];
    
    [self.navigationController pushViewController:viewController animated:true];
}
@end
