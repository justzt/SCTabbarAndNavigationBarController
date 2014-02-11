//
//  BaseViewController.m
//  SCTabBarAndNavgationBarVC
//
//  Created by zt on 14-2-11.
//  Copyright (c) 2014年 zt. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    self.navBar.title.text = @"基础vc";
    
    CGFloat heigth = CGRectGetHeight(self.view.frame)-CGRectGetHeight(self.navBar.frame);
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.navBar.frame), 320, heigth)];
    [self.view addSubview:self.contentView];
    
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    DLogF(@"contentview frame:%@", self.contentView);
}


- (void)navgationBar:(id)bar leftButtonAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
