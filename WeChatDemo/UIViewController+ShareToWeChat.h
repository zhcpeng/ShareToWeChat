//
//  UIViewController+ShareToWeChat.h
//  WeChatDemo
//
//  Created by Mac on 14-7-24.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WXApi.h"
#import "WXApiObject.h"

@interface UIViewController (ShareToWeChat)<WXApiDelegate>

+(void)shareToWeChatWithTitle:(NSString *)title Description:(NSString *)description Image:(UIImage *) URLStr:(NSString *)url;


-(void)shareToWeChatWithTitle:(NSString *)title Description:(NSString *)description LinkURL:(NSString *)linkURL;

@end
