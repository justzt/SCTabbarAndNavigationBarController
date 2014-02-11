//
//  ItemViewController.m
//  SCTabBarAndNavgationBarVC
//
//  Created by zt on 14-2-10.
//  Copyright (c) 2014年 zt. All rights reserved.
//

#import "ItemViewController.h"
#import "BaseViewController.h"



@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 200);
    [button setTitle:@"adfasdf" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushToVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pushToVC{
    BaseViewController *vc = [[BaseViewController alloc] init];
    [RootNav pushViewController:vc animated:YES];
}
@end
