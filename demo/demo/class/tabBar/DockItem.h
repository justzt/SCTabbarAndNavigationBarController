//
//  DockItem.h
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  一个选项卡标签

#import <UIKit/UIKit.h>

@interface DockItem : UIButton
{
    UILabel *notifyCounter;
    UIImageView *numberBGView;
}

- (void)modifyNotifyCounterFrame;
- (void)setMessageNumber:(NSString*)str;
@end
