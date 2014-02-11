//
//  NavigationController.m
//  MaiChe
//
//  Created by zt on 13-11-14.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

@synthesize navBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navBar = [[SCNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44+(SystermVersion>=7?20:0))];
    self.navBar.delegate = self;
    [self.view addSubview:navBar];
}


#pragma mark - SCNavigationBarDelegate
- (void)navgationBar:(id)bar leftButtonAction:(UIButton *)button{
    
}

- (void)navgationBar:(id)bar rightButtonAction:(UIButton *)button{

}
@end
