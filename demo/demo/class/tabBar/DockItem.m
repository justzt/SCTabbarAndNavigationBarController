//
//  DockItem.m
//  新浪微博
//
//  Created by apple on 13-10-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "DockItem.h"

#define kDockItemSelectedBG @"dockItemSelectedBG"
//可以显示数字的背景
#define kNotifyConterWithNumberBG @"nav_news2"
//不需要显示数字的背景
#define kNotifyConterWithoutNumberBG @"nav_news"

// 文字的高度比例
#define kTitleRatio 0.3

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        // normal字体颜色
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        // 选中的字体颜色
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        // 4.设置选中时的背景
        [self setBackgroundImage:[UIImage imageNamed:kDockItemSelectedBG] forState:UIControlStateSelected];
        
        // 5.增加消息显示区
        [self addMessageArea];
    }
    return self;
}

// 增加消息显示区
- (void)addMessageArea{
    notifyCounter = [[UILabel alloc] init];
//    notifyCounter.hidden = YES;
    notifyCounter.textAlignment = NSTextAlignmentCenter;
    UIImage *img = [[UIImage imageNamed:kNotifyConterWithNumberBG] stretchableImageWithLeftCapWidth:12 topCapHeight:10];
    notifyCounter.backgroundColor = [UIColor clearColor];
    notifyCounter.font = [UIFont boldSystemFontOfSize:10];
    notifyCounter.textColor = [UIColor whiteColor];
    numberBGView = [[UIImageView alloc] initWithImage:img];
//    numberBGView.hidden = YES;
    [self addSubview:numberBGView];
    [self addSubview:notifyCounter];
}

#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * ( 1- kTitleRatio );
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight - 3;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

#pragma mark DocItem的frame确定后调整消息框的frame
- (void)modifyNotifyCounterFrame{
    notifyCounter.frame = CGRectMake(0, 10, 27, 24);
    numberBGView.frame = notifyCounter.frame;
    CGPoint center = self.imageView.center;
    numberBGView.center = CGPointMake(center.x+20, center.y-5);
    notifyCounter.center = numberBGView.center;
}

#pragma mark 设置消息数,0不显示，-1为圆点，大于100显示99+
- (void)setMessageNumber:(NSString*)str{
    notifyCounter.text = str;
    notifyCounter.hidden = NO;
    numberBGView.hidden = NO;
    //消息数为0隐藏消息框
    if ([str integerValue] == 0) {
        notifyCounter.hidden = YES;
        numberBGView.hidden = YES;
    }
    //消息为-1显示圆点
    else if ([str integerValue] == -1){
        //重设圆点的frame
        notifyCounter.frame = CGRectMake(CGRectGetWidth(self.frame)-35, 2, 14, 12);
        numberBGView.frame = notifyCounter.frame;
        //设置圆点的背景
        notifyCounter.text = @"";
        numberBGView.image = [UIImage imageNamed: kNotifyConterWithoutNumberBG];
    }
    else if([str integerValue] > 99){
        notifyCounter.text = @"99+";
    }
    
    //十位数一下用kNotifyConterWithoutNumberBG，以上用kNotifyConterWithNumberBG
    NSString *imgName = str.length>1 ? @"nav_news2@2x" : @"nav_news@2x";
    UIImage *img = [UIImage imageNamed:imgName];
    img = [img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
    numberBGView.image = img;
}
@end
