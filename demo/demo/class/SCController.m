//
//  SCController.m
//  SCTabBarAndNavgationBarVC
//
//  Created by zt on 14-2-10.
//  Copyright (c) 2014年 zt. All rights reserved.
//

#import "SCController.h"
#import "DockItem.h"
#import "Dock.h"
#import "ItemViewController.h"

#define kDockHeight 44

@interface SCController ()<DockDelegate>
{
    NSArray *controllerNameArray;
    NSMutableDictionary *controllerDic;
    UIView *contentView;
    
    Dock *_dock;
}
@end

@implementation SCController


- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    self.navBar.title.text = @"main";
    self.navBar.leftButton.hidden = YES;
    
    //默认加载MyCarViewController
    controllerNameArray = @[@"ItemViewController", @"ItemViewController", @"ItemViewController"];//@"ShangJiViewController",
    [self addTabBar];
    
    // content view
    CGFloat marginTop = CGRectGetHeight(self.navBar.frame);
    CGFloat height = ([[UIScreen mainScreen] bounds].size.height)-marginTop-(SystermVersion>=7?0:20)-44;
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, marginTop, 320, height)];
    contentView.clipsToBounds = YES;
    contentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:contentView];
    
    //第一个item的view显示
    [self dock:_dock itemSelectedFrom:0 to:0];
}


#pragma mark 添加tabBar
- (void)addTabBar{
    Dock *dock = [[Dock alloc] init];
    dock.backgroundColor = [UIColor greenColor];
    dock.frame = CGRectMake(0, self.view.frame.size.height - kDockHeight, self.view.frame.size.width, kDockHeight);
    dock.delegate = self;
    [self.view addSubview:dock];
    _dock = dock;
    
    //设置item的图片和选中的图片
    [_dock addItemWithIcon:@"nav_mycar2" selectedIcon:@"nav_mycar" title:@"我的车"];
    [_dock addItemWithIcon:@"nav_publish2" selectedIcon:@"nav_publish" title:@"发车"];
    //    [_dock addItemWithIcon:@"nav_dog2" selectedIcon:@"nav_dog" title:@"商机"];
    [_dock addItemWithIcon:@"nav_set2" selectedIcon:@"nav_set" title:@"设置"];
    
    //设置默认的消息数
    [_dock setItemMessageNumber:@"10" forIndex:0];
    [_dock setItemMessageNumber:@"0" forIndex:1];
    [_dock setItemMessageNumber:@"0" forIndex:2];
}

// 未读消息点击后重设数字
- (void)resetUnreadMessage:(NSNotification*)noti{
    int deathNumber = [[noti object] intValue];
    [self showUnreadAllNumberByDeath:deathNumber];
}

//在dock上展示未读消息总数
- (void)showUnreadAllNumberByDeath:(int)death{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_dock setItemMessageNumber:@"10" forIndex:0];
    });
}

- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to{
    int index = to;
    if (controllerDic == nil) {
        controllerDic = [NSMutableDictionary dictionary];
    }
    ItemViewController *vc = (ItemViewController*)[controllerDic objectForKey:[controllerNameArray objectAtIndex:index]];
    if (vc == nil) {
        Class class = NSClassFromString([controllerNameArray objectAtIndex:index]);
        NSObject *obj = [[class alloc] init];
        vc = (ItemViewController*)obj;
        [controllerDic setObject:vc forKey:[controllerNameArray objectAtIndex:index]];
    }
    
    switch (to) {
        case 0:
            vc.view.backgroundColor = [UIColor grayColor];
            break;
        case 1:
            vc.view.backgroundColor = [UIColor blueColor];
            break;
        case 2:
            vc.view.backgroundColor = [UIColor greenColor];
            break;
        default:
            break;
    }
    
    
    [[contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [contentView addSubview:vc.view];
    
    //清空dock上的消息数
    //    [_dock setItemMessageNumber:@"0" forIndex:to];
}

@end
