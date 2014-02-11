//
//  SCNavigationBar.h
//  MaiChe
//
//  Created by zt on 13-11-14.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCNavigationBarDelegate <NSObject>

@required
- (void)navgationBar:(id)bar leftButtonAction:(UIButton*)button;
- (void)navgationBar:(id)bar rightButtonAction:(UIButton*)button;

@end

@interface SCNavigationBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (nonatomic, weak) id<SCNavigationBarDelegate> delegate;

- (IBAction)backButtonAction:(id)sender;
- (IBAction)rightButtonAction:(id)sender;

@end
