//
//  SCNavigationBar.m
//  MaiChe
//
//  Created by zt on 13-11-14.
//  Copyright (c) 2013年 zt. All rights reserved.
//

#import "SCNavigationBar.h"

#define kSCNavigationBarHeight 44
#define LoadNibWithName(name) ([[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil] objectAtIndex:0])

@implementation SCNavigationBar

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = LoadNibWithName(@"SCNavigationBar");
        self.frame = frame;
        
//        NSArray *colors = @[[UIColor colorWithHexStr:@"#f0ad4c"], [UIColor colorWithHexStr:@"#ed913e"]];
//        CALayer *gradientLayer = [SCGradient gradientLayerframe:self.bounds colorArray:colors];
//        [self.layer insertSublayer:gradientLayer atIndex:0];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
//    self.rightButton = [[DAReloadActivityButton alloc] initWithFrame:CGRectMake(280, (self.frame.size.height-24)/2, 24, 24)];
//    [self.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:self.rightButton];
}

- (void)layoutSubviews{
    [super layoutSubviews];
 
    CGFloat barHeight = CGRectGetHeight(self.frame);
    if (barHeight > kSCNavigationBarHeight) {
        CGRect frame = self.leftButton.frame;
        frame.origin.y += 20;;
        self.leftButton.frame = frame;
        
        frame = self.title.frame;
        frame.origin.y += 20;;
        self.title.frame = frame;
        
//        frame = self.rightButton.frame;
//        frame.origin.y += 20;
//        self.rightButton.frame = frame;
    }
}


- (IBAction)backButtonAction:(id)sender {
//    [self.rightButton stopAnimating];
    if (self.delegate && [self.delegate respondsToSelector:@selector(navgationBar:leftButtonAction:)]) {
        [self.delegate navgationBar:self leftButtonAction:(UIButton*)sender];
    }
}

- (IBAction)rightButtonAction:(id)sender {
//    if (self.rightButton.animating == NO) {
//        [self.rightButton startAnimating];
//    }
//    if (self.delegate && [self.delegate respondsToSelector:@selector(navgationBar:rightButtonAction:)]) {
//        [self.delegate navgationBar:self rightButtonAction:(UIButton*)sender];
//    }
}
@end
