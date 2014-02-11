//
//  Dock.h
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  底部的工具条（选项卡条）

#import <UIKit/UIKit.h>
#import "DockItem.h"

@class Dock;

@protocol DockDelegate <NSObject>
@optional
- (void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;
@end

@interface Dock : UIView
// 添加一个选项卡
- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title;
// 为选项卡指定消息数
- (void)setItemMessageNumber:(NSString*)str forIndex:(int)index;
- (void)itemClick:(DockItem *)item;
// 代理
@property (nonatomic, weak) id<DockDelegate> delegate;

@property (nonatomic, assign) int selectedIndex;
@end