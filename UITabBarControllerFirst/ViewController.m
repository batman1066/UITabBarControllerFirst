//
//  ViewController.m
//  UItalBarC
//
//  Created by yang ming on 2016/12/4.
//  Copyright © 2016年 yang ming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarDelegate>
@property (nonatomic,strong) UITabBar *tabBar;
@property (nonatomic,strong) UIView *firstView;
@property (nonatomic,strong) UIView *secondView;
@property (nonatomic,strong) UIView *thirdView;
@end

@implementation ViewController
- (UITabBar *)tabBar{
    if (!_tabBar) {
        _tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height - 50, self.view.bounds.size.width, 50)];
        //将tabBar加到父视图
        [self.view addSubview:self.tabBar];
    }
    return _tabBar;
}
-(UIView *)firstView{
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
        _firstView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_firstView];
    }
    return _firstView;
}
-(UIView *)secondView{
    if (!_secondView) {
        _secondView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
        _secondView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_secondView];
    }
    return _secondView;
}
-(UIView *)thirdView{
    if (!_thirdView) {
        _thirdView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
        _thirdView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_thirdView];
    }
    return _thirdView;
}- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"didSelect");
    switch (item.tag) {
        case 0:
            self.secondView = nil;
            self.thirdView = nil;
            
            break;
        case 1:
            self.firstView = nil;
            self.thirdView = nil;
            
            [self secondView];
           
            break;
        case 2:
            self.secondView = nil;
            self.thirdView = nil;
            
            [self thirdView];
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.delegate = self;//设置代理
    //初始化三个item
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];//系统图标创建标签项
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"百度" image:[UIImage imageNamed:@"1.png"] tag:1];//用用户图标创建标签项
    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTitle:@"宏创" image:[UIImage imageNamed:@"1.png"] tag:2];
    //为secondItem设置徽标
    secondItem.badgeValue = @"2";//item的徽标
    self.tabBar.items = @[firstItem,secondItem,thirdItem];//设置多个标签项
    //tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.backgroundColor = [UIColor redColor];//背景色
    // tabBar.backgroundImage = [UIImage imageNamed:@"1"];//背景图片
    self.tabBar.tintColor = [UIColor blackColor];//选中item的颜色
    // tabBar.barTintColor = [UIColor greenColor];//bar的颜色
    self.tabBar.translucent = YES;//是否半透明    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
