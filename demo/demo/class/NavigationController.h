//
//  NavigationController.h
//  MaiChe
//
//  Created by zt on 13-11-14.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCNavigationBar.h"



@interface NavigationController : UIViewController<SCNavigationBarDelegate>

@property (strong, nonatomic) SCNavigationBar *navBar;

@end
