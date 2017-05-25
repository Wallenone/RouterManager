//
//  CETRouterManager.h
//  EZJCET6
//
//  Created by EASYJIE520 on 16/5/9.
//  Copyright © 2016年 EZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface RouterManager : NSObject


+ (instancetype)shareInstance;

+ (UIViewController *)getCurrentVC;

+ (NSDictionary *)initWithFileName:(NSString *)fileName
                         extension:(NSString *)extension;


+ (void) pushViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter ;
+ (void) PresentViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter ;
+ (void) popRootViewController;
+ (void) popViewController;
+ (void) popToViewController:(NSString *)aController params:(NSDictionary *)aParams;
+ (void) dismissViewControllerCompletion:(void (^)(void))completion;
@end
