//
//  ViewController.h
//  WeChatDemo
//
//  Created by Mac on 14-7-24.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WXApi.h"
#import "WXApiObject.h"

@interface ViewController : UIViewController<WXApiDelegate>





- (IBAction)btnShareWeChatAction:(UIButton *)sender;

@end
