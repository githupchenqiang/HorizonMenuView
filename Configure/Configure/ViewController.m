//
//  ViewController.m
//  Configure
//
//  Created by chenq@kensence.com on 15/3/8.
//  Copyright © 2015年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalMenuView.h"


@interface ViewController ()<HorizontalMenuPritocol>

@property (nonatomic ,strong)NSArray *MenuArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.title = @"头条";
    
    
    NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    
    //初始化添加视图
    HorizontalMenuView *menuView = [HorizontalMenuView new];
    menuView.frame = CGRectMake(0, 64, self.view.frame.size.width, 45);
    menuView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:menuView];
    
    
    //设置菜单栏名
    _MenuArray = [NSArray arrayWithObjects:@"头条",@"推荐",@"热点",@"社会",@"娱乐", nil];
    [menuView setNameWithArray:_MenuArray];
    menuView.HorizonDelegate = self;
}

- (void)GetTag:(NSInteger)tag
{
    self.navigationItem.title = [NSString stringWithFormat:@"%@",[_MenuArray objectAtIndex:tag]];
    NSLog(@"菜单%ld",tag);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
