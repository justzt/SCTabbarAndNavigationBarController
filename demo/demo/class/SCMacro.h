//
//  SCMacro.h
//  SCTabBarAndNavgationBarVC
//
//  Created by zt on 14-2-11.
//  Copyright (c) 2014年 zt. All rights reserved.
//

#ifndef SCTabBarAndNavigationBarVC_SCMacro_h
#define SCTabBarAndNavgiationBarVC_SCMacro_h

//#define SCDEBUG

#if defined(SCDEBUG)
    #define DLog(A) NSLog((@"%@(%d): %@"),[[NSString stringWithFormat:@"%s", __FILE__] lastPathComponent], __LINE__, A)
    #define DLogF(fmt, ...)  NSLog((@"%@(%d): " fmt),[[NSString stringWithFormat:@"%s", __FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__)
#else
    #define DLog(A)
    #define DLogF(fmt, ...)
#endif

#define RootNav  ((UINavigationController*)[UIApplication sharedApplication].keyWindow.rootViewController)
#define SystermVersion [[UIDevice currentDevice] systemVersion].intValue

#endif
