//
//  CETRouterManager.m
//  EZJCET6
//
//  Created by EASYJIE520 on 16/5/9.
//  Copyright © 2016年 EZJ. All rights reserved.
//

#import "RouterManager.h"
#import "VOVCManager.h"

@implementation RouterManager

+ (instancetype)shareInstance
{
    static RouterManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [RouterManager new];
        
    });
    return _instance;
    
}

+ (NSDictionary *)initWithFileName:(NSString *)fileName
                         extension:(NSString *)extension{
    NSString *strJSONPath =
    [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
    NSDictionary *dict = [NSJSONSerialization
                          JSONObjectWithData:[NSData dataWithContentsOfFile:strJSONPath]
                          options:0
                          error:nil];
    
    return dict;
}


+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
    result = nextResponder;
    else
    result = window.rootViewController;
    
    return result;
}


+ (void) pushViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter {
    VVHop *hop = [VVHop hopWithMethod:VVHop_Push aStoryboard:nil aController:viewControllerName parameters:parnmerter];
    [VVManager showPageWithHop:hop];
    
}


+ (void) PresentViewConrollerName:(NSString *)viewControllerName parameters:(NSDictionary *)parnmerter {
    VVHop *hop = [VVHop hopWithMethod:VVHop_Present aStoryboard:nil aController:viewControllerName parameters:parnmerter];
    [VVManager showPageWithHop:hop];
}

+ (void)popRootViewController
{
    [[VVManager currentNaviController] popToRootViewControllerAnimated:YES];
}

+ (void) popViewController{
    [[VVManager currentNaviController] popViewControllerAnimated:YES];
}

+ (void) popToViewController:(NSString *)aController params:(NSDictionary *)aParams{
    
    [VVManager showPageWithHop:[VVHop hopWithMethod:VVHop_Pop aStoryboard:nil aController:aController parameters:aParams]];
}

+ (void) dismissViewControllerCompletion:(void (^)(void))completion{
    [[VVManager currentNaviController] dismissViewControllerAnimated:YES completion:^{
        if (completion) {
            completion();
        }
    } ];
}

@end
